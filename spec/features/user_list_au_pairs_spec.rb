require 'rails_helper'

feature 'User list aupairs' do

  scenario 'successfully' do
    nanny_1 = create(:au_pair)
    nanny_2 = create(:au_pair)

    visit root_path
    click_on 'Encontre Babás'

    expect(page).to have_content('Babás')
    expect(page).to have_content('Nanny #1')
    expect(page).to have_content("Habilidades: #{nanny_1.skills}")
    expect(page).to have_content("Formação: #{nanny_1.degree}")
    expect(page).to have_content("Cidade: #{nanny_1.city}")

    expect(page).to have_content('Nanny #2')
  end

  scenario 'and has no au_pair' do
    visit root_path
    click_on 'Encontre Babás'

    expect(page).to have_content('Babás')
    expect(page).to have_content('Nenhuma babá encontrada')
  end


end