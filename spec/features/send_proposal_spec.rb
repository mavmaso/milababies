require 'rails_helper'

feature 'Send proposal' do
  scenario 'successfully' do
    # cria
    nanny1 = create(:au_pair, name: 'Nana', wage: 40)
    # navega
    visit root_path
    click_on 'Encontre Babás'
    within "#aupair-#{nanny1.id}" do
      click_on 'Ver Mais'
    end
    click_on 'Fazer Contratação'
    fill_in 'Data', with: '01/01/2018'
    fill_in 'Hora de Início', with: '13:00'
    fill_in 'Hora de Término', with: '16:00'
    fill_in 'Messagem', with: 'Apenas para testar o serviço'
    click_on 'Enviar'
    # expectativa
    expect(page).to have_content('Proposta enviada com sucesso')
    expect(page).to have_content("Contrada: #{nanny1.name}")
    expect(page).to have_content('Data: 01/01/2018')
    expect(page).to have_content('Hora de Início: 13:00')
    expect(page).to have_content('Hora de Término: 16:00')
    expect(page).to have_content('Mensagem: Apenas para testar o serviço')
    expect(page).to have_content('Preço Final: R$ 120,00')
  end
  scenario 'fail' do
    # cria
    nanny1 = create(:au_pair, name: 'Nana', wage: 40)
    # navega
    visit root_path
    click_on 'Encontre Babás'
    within "#aupair-#{nanny1.id}" do
      click_on 'Ver Mais'
    end
    click_on 'Fazer Contratação'
    fill_in 'Data', with: ' '
    fill_in 'Hora de Início', with: ' '
    fill_in 'Hora de Término', with: ' '
    fill_in 'Messagem', with: 'Apenas para testar o serviço'
    click_on 'Enviar'
    # expectativa
    expect(page).to have_content('Proposta não pode ser enviada')
    expect(page).to have_content('Apenas para testar o serviço')
  end
end
