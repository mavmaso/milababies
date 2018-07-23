require "rails_helper"

feature 'Send proposal' do
  scenario 'successfully' do 
    #cria
    nanny1 = create(:au_pair, name: 'Nana', wage: 40 )
    #navega
    visit root_path
    click_on 'Encontrar Babás'
    click_on 'Nana'
    click_on 'Fazer Contratação'
    
    fill_in 'Data', with: '01/01/2018'
    fill_in 'Hora de Início', with:  '13:00'
    fill_in 'Hora de Término', with: '16:00'
    
    #expectativa
    expect(page).to have_content('Proposta enviada com sucesso')
    expect(page).to have_content("Contrada: #{nanny1.name}")
    expect(page).to have_content('Data: 01/01/2018')
    expect(page).to have_content('Hora de Início: 13:00')
    expect(page).to have_content('Hora de Término: 16:00')
    expect(page).to have_content('Preço final: R$ 120,00')
  end
end
