require 'rails_helper'

feature 'View who' do
  scenario 'successfully' do
    visit root_path
    click_on 'Quem Somos'
    expect(page).to have_content('Mila Babies é uma aplicação')
  end
end
