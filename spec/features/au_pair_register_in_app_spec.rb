require 'rails_helper'

feature 'Au pair register in app' do
  scenario 'successfully' do
    au_pair = build(:au_pair)

    visit root_path
    click_on 'Trabalhe conosco'

    fill_in 'Nome', with: au_pair.name
    fill_in 'Email', with: au_pair.email
    fill_in 'Telefone', with: au_pair.phone
    fill_in 'CPF', with: au_pair.cpf
    fill_in 'Habilidades', with: au_pair.skills
    fill_in 'Formação', with: au_pair.degree
    fill_in 'Idiomas', with: au_pair.languages
    fill_in 'Data de Nascimento', with: au_pair.birth_date
    fill_in 'Cidade', with: au_pair.city
    fill_in 'Valor/hora', with: au_pair.wage
    attach_file 'Foto', Rails.root.join('spec', 'support', 'nophoto.jpg')
    click_on 'Enviar'

    expect(page).to have_css('h1', text: au_pair.name)
    expect(page).to have_css('li', text: au_pair.email)
    expect(page).to have_css('li', text: au_pair.phone)
    expect(page).to have_css('li', text: au_pair.skills)
    expect(page).to have_css('li', text: au_pair.degree)
    expect(page).to have_css('li', text: au_pair.languages)
    expect(page).to have_css('li', text: I18n.l(au_pair.birth_date))
    expect(page).to have_css('label', text: "Cidade #{au_pair.city}")
    expect(page).to have_css('h2', text: 'Status Pendente')
    expect(page).to_not have_link('Fazer Contratação')
    expect(page).to_not have_link('Criar depoimento')
  end
end
