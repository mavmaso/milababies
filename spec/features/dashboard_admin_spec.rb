require 'rails_helper'

feature 'View Proposal' do
  scenario 'successfully' do
    # criar
    nanny1 = create(:au_pair, name: 'Nana', wage: 40, email: 'n@mail.com',
                              phone: '114444666')
    create(:proposal, booked_date: '2018-01-01', start_hour: '20:00',
                      end_hour: '22:00', au_pair: nanny1,
                      message: 'Teste de proposta')
    create(:admin, name: 'Camila', email: 'camila@mail.com', password: '123456')
    # navegar
    visit new_admin_session_path
    fill_in 'Email', with: 'camila@mail.com'
    fill_in 'Senha', with: '123456'
    click_on 'Logar'
    click_on 'Admin: Camila'
    click_on 'Proposta #1'
    # expectativa
    expect(page).to have_content('Proposta #1')
    expect(page).to have_content("Contratada: #{nanny1.name}")
    expect(page).to have_content(nanny1.email)
    expect(page).to have_content(nanny1.phone)
    expect(page).to have_content('Data: 01/01/2018')
    expect(page).to have_content('Hora de Início: 20:00')
    expect(page).to have_content('Hora de Término: 22:00')
    expect(page).to have_content('Mensagem: Teste de proposta')
    expect(page).to have_content('Preço Final: R$ 80,00')
  end
  scenario 'View empty Dashboard' do
    # criar
    create(:admin, name: 'Camila', email: 'camila@mail.com', password: '123456')
    # navegar
    visit admin_path
    fill_in 'Email', with: 'camila@mail.com'
    fill_in 'Senha', with: '123456'
    click_on 'Logar'
    # expectativa
    expect(page).to have_content('Dashboard do Admin')
    expect(page).to have_content('Sem Propostas no momento')
  end
end
