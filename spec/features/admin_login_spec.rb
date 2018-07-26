require 'rails_helper'

feature 'Login as Admin' do
  scenario 'successfully' do
    # criar
    create(:admin, name: 'Camila', email: 'camila@mail.com', password: '123456')
    # navegar
    visit new_admin_session_path
    fill_in 'Email', with: 'camila@mail.com'
    fill_in 'Senha', with: '123456'
    click_on 'Logar'
    # expectativa
    expect(page).to have_content('Admin: Camila')
    expect(page).to have_content('Sair')
  end
  scenario 'Log off' do
    # criar
    create(:admin, name: 'Camila', email: 'camila@mail.com', password: '123456')
    # navegar
    visit new_admin_session_path
    fill_in 'Email', with: 'camila@mail.com'
    fill_in 'Senha', with: '123456'
    click_on 'Logar'
    click_on 'Sair'
    # expectativa
    expect(page).not_to have_content('Admin: Camila')
    expect(page).not_to have_content('Sair')
  end
  scenario 'Dont have account' do
    # navegar
    visit new_admin_session_path
    # expectativa
    expect(page).not_to have_content('Sign up')
    expect(page).to have_content('Login')
    expect(page).to have_content('Email')
    expect(page).to have_content('Senha')
  end
end
