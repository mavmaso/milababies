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

  scenario 'and filter by name' do
    nanny_3 = create(:au_pair)
    nanny_4 = create(:au_pair)

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: nanny_4.name
    click_on 'Buscar'

    expect(page).to have_content('Babás')
    expect(page).to have_content('Nanny #4')
    expect(page).to have_content("Habilidades: #{nanny_4.skills}")
    expect(page).to have_content("Formação: #{nanny_4.degree}")
    expect(page).to have_content("Cidade: #{nanny_4.city}")

    expect(page).not_to have_content('Nanny #3')
  end

  scenario 'and filter by firsts chars of name ' do
    nanny_5 = create(:au_pair)
    nanny_6 = create(:au_pair)

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: 'Nanny'
    click_on 'Buscar'

    expect(page).to have_content('Nanny #5')
    expect(page).to have_content('Nanny #6')
  end

  scenario 'and filter by lasts chars of name' do
    nanny_7 = create(:au_pair)
    nanny_8 = create(:au_pair)

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: 'y #7'
    click_on 'Buscar'

    expect(page).to have_content('Nanny #7')
    expect(page).not_to have_content('Nanny #8')
  end

  scenario 'and filter by name ignoring case' do
    nanny_9 = create(:au_pair)
    nanny_10 = create(:au_pair)

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: 'NANNY #10'
    click_on 'Buscar'

    expect(page).to have_content('Nanny #10')
    expect(page).not_to have_content('Nanny #9')
  end

  scenario 'and filter by empty name' do
    nanny_11 = create(:au_pair)
    nanny_12 = create(:au_pair)

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: ''
    click_on 'Buscar'

    expect(page).to have_content('Nanny #11')
    expect(page).to have_content('Nanny #12')
  end
end