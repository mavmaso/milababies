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
end
