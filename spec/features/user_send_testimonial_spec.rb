require 'rails_helper'

feature 'User send testimonial ' do
  scenario 'successfully' do
    create(:au_pair, name: 'Nanny')
    visit root_path
    click_on 'Encontre Babás'
    click_on 'Ver Mais'
    click_on 'Criar depoimento'
    fill_in 'Título', with: 'Muito Bom'
    fill_in 'Descrição', with: 'Gostei bastante'
    click_on 'Salvar'
    expect(page).to have_content('Muito Bom')
  end

  scenario 'and leaves blanks fields' do
    create(:au_pair, name: 'Nanny')
    visit root_path
    click_on 'Encontre Babás'
    click_on 'Ver Mais'
    click_on 'Criar depoimento'
    fill_in 'Título', with: ''
    fill_in 'Descrição', with: ''
    click_on 'Salvar'
    expect(page).to have_content('Você deve preencher todos os campos')
  end
end
