require 'rails_helper'

feature 'Admin register AuPair' do
  scenario 'successfully' do
    camila_admin = create(:admin)

    visit new_admin_session_path
    fill_in 'Email', with: camila_admin.email
    fill_in 'Senha', with: camila_admin.password
    click_on 'Logar'

    visit root_path
    click_on 'Cadastrar Babá'
    fill_in 'Nome', with: 'Super Nanny'
    fill_in 'Email', with: 'nany@milababies.com'
    fill_in 'Telefone', with: '(11) 1234-5678'
    fill_in 'CPF', with: '123456789-00'
    fill_in 'Habilidades', with: 'Brincadeiras lúdicas em Português e Alemão'
    fill_in 'Formação', with: 'Superior Completo em Letras'
    fill_in 'Idiomas', with: 'Português Nativo, Alemão Avançado e Inglês Básico'
    fill_in 'Data de Nascimento', with: '01/01/1990'
    fill_in 'Cidade', with: 'São Paulo'
    fill_in 'Valor/hora', with: '40'
    attach_file 'Foto', Rails.root.join('spec', 'support', 'nophoto.jpg')
    click_on 'Enviar'

    au_pair = AuPair.last
    expect(page).to have_css('h1', text: 'Super Nanny')
    expect(page).to have_css('li', text: '01/01/1990')
    expect(page).to have_css('li', text: 'R$ 40,00')
    expect(page).to have_css('img[src*="nophoto.jpg"]')
    expect(current_path).to eq au_pair_path(au_pair.id)
    expect(page).to have_link('Fazer Contratação')
    expect(page).to have_link('Criar depoimento')
  end

  scenario 'and must fill in all fields' do
    camila_admin = create(:admin)

    visit new_admin_session_path
    fill_in 'Email', with: camila_admin.email
    fill_in 'Senha', with: camila_admin.password
    click_on 'Logar'

    visit root_path
    click_on 'Cadastrar Babá'

    fill_in 'Nome', with: ''
    fill_in 'Email', with: ''
    fill_in 'Telefone', with: ''
    fill_in 'Valor/hora', with: ''
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Cadastrar Nova Babá')
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Valor/hora não pode ficar em branco')
    expect(page).to have_content('Foto não pode ficar em branco')
  end

  scenario 'and cannot register with duplicate CPF' do
    create(:au_pair, cpf: '12345678900')
    camila_admin = create(:admin)

    visit new_admin_session_path
    fill_in 'Email', with: camila_admin.email
    fill_in 'Senha', with: camila_admin.password
    click_on 'Logar'

    visit root_path
    click_on 'Cadastrar Babá'

    fill_in 'Nome', with: 'Super Nanny'
    fill_in 'Email', with: 'nany@milababies.com'
    fill_in 'Telefone', with: '(11) 1234-5678'
    fill_in 'CPF', with: '12345678900'
    fill_in 'Habilidades', with: 'Brincadeiras lúdicas em Português e Alemão'
    fill_in 'Formação', with: 'Superior Completo em Letras'
    fill_in 'Idiomas', with: 'Português Nativo, Alemão Avançado e Inglês Básico'
    fill_in 'Data de Nascimento', with: '01/01/1990'
    fill_in 'Cidade', with: 'São Paulo'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Cadastrar Nova Babá')
    expect(page).to have_content('CPF já está em uso')
  end
end
