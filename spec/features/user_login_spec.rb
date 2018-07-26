require 'rails_helper'

feature 'User login' do
  scenario 'successfully' do
    florinda = create(:user)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: florinda.email
    fill_in 'Senha', with: florinda.password
    click_on 'Logar'

    expect(current_path).to eq au_pairs_path
    expect(page).to have_content("Usuário: #{florinda.email}")
    expect(page).to have_link('Sair')
    expect(page).to_not have_link('Entrar')
    expect(page).to_not have_link('Trabalhe conosco')
    expect(page).to_not have_link('Cadastrar babás')
  end

  scenario 'and logout' do
    florinda = create(:user)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: florinda.email
    fill_in 'Senha', with: florinda.password
    click_on 'Logar'
    click_on 'Sair'

    expect(current_path).to eq root_path
    expect(page).to_not have_content("Usuário: #{florinda.email}")
    expect(page).to_not have_link('Sair')
    expect(page).to have_link('Entrar')
    expect(page).to have_link('Trabalhe conosco')
  end

  scenario 'and create an account' do
    florinda = build(:user)

    visit root_path
    click_on 'Entrar'
    click_on 'Cadastrar-se'

    fill_in 'Email', with: florinda.email
    fill_in 'Responsável principal', with: florinda.main_responsible
    fill_in 'Telefone principal', with: florinda.main_phone
    fill_in 'Responsável secundário', with: florinda.second_responsible
    fill_in 'Telefone secundário', with: florinda.second_phone
    fill_in 'Senha', with: florinda.password
    fill_in 'Confirme sua senha', with: florinda.password

    click_on 'Enviar'

    user = User.last
    expect(current_path).to eq au_pairs_path
    expect(page).to have_content("Usuário: #{florinda.email}")
    expect(user.main_responsible).to eq florinda.main_responsible
    expect(user.second_responsible).to eq florinda.second_responsible
    expect(user.main_phone).to eq florinda.main_phone
    expect(user.second_phone).to eq florinda.second_phone
  end

  scenario 'and create an account' do
    florinda = build(:user)

    visit root_path
    click_on 'Entrar'
    click_on 'Cadastrar-se'

    fill_in 'Email', with: florinda.email
    fill_in 'Responsável principal', with: florinda.main_responsible
    fill_in 'Telefone principal', with: florinda.main_phone
    fill_in 'Responsável secundário', with: florinda.second_responsible
    fill_in 'Telefone secundário', with: florinda.second_phone
    fill_in 'Senha', with: florinda.password
    fill_in 'Confirme sua senha', with: florinda.password

    click_on 'Enviar'

    user = User.last
    expect(current_path).to eq au_pairs_path
    expect(page).to have_content("Usuário: #{florinda.email}")
    expect(user.main_responsible).to eq florinda.main_responsible
    expect(user.second_responsible).to eq florinda.second_responsible
    expect(user.main_phone).to eq florinda.main_phone
    expect(user.second_phone).to eq florinda.second_phone
  end

  scenario 'and create an account with blank fields' do
    florinda = build(:user)

    visit root_path
    click_on 'Entrar'
    click_on 'Cadastrar-se'

    fill_in 'Email', with: florinda.email
    fill_in 'Responsável principal', with: ''
    fill_in 'Telefone principal', with: ''
    fill_in 'Responsável secundário', with: ''
    fill_in 'Telefone secundário', with: ''
    fill_in 'Senha', with: florinda.password
    fill_in 'Confirme sua senha', with: florinda.password

    click_on 'Enviar'

    texto_validacao = 'Responsável principal não pode ficar em branco'
    expect(page).to have_content('Por favor, corrija os problemas abaixo')
    expect(page).to have_content(texto_validacao)
    expect(page).to have_content('Telefone principal não pode ficar em branco')
  end
end
