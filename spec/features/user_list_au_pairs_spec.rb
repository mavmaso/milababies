require 'rails_helper'

feature 'User list aupairs' do
  scenario 'successfully' do
    nanny = create(:au_pair, name: 'Nanny')
    another_nanny = create(:au_pair, name: 'Baba')

    visit root_path
    click_on 'Encontre Babás'

    expect(page).to have_content('Babás')
    expect(page).to have_content(nanny.name)
    expect(page).to have_content("Habilidades: #{nanny.skills}")
    expect(page).to have_content("Formação: #{nanny.degree}")
    expect(page).to have_content("Cidade: #{nanny.city}")
    expect(page).to have_css('img[src*="nophoto.jpg"]')

    expect(page).to have_content(another_nanny.name)
  end

  scenario 'and has no au_pair' do
    visit root_path
    click_on 'Encontre Babás'

    expect(page).to have_content('Babás')
    expect(page).to have_content('Nenhuma babá encontrada')
  end

  scenario 'and filter by name' do
    nanny = create(:au_pair, name: 'Nanny')
    another_nanny = create(:au_pair, name: 'Baba')

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: another_nanny.name
    click_on 'Buscar'

    expect(page).to have_content('Babás')
    expect(page).to have_content(another_nanny.name)
    expect(page).to have_content("Habilidades: #{another_nanny.skills}")
    expect(page).to have_content("Formação: #{another_nanny.degree}")
    expect(page).to have_content("Cidade: #{another_nanny.city}")

    expect(page).not_to have_content(nanny.name)
  end

  scenario 'and filter by firsts chars of name ' do
    create(:au_pair, name: 'Nanny Primeira')
    create(:au_pair, name: 'Nanny Segunda')

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: 'Nanny'
    click_on 'Buscar'

    expect(page).to have_content('Nanny Primeira')
    expect(page).to have_content('Nanny Segunda')
  end

  scenario 'and filter by lasts chars of name' do
    create(:au_pair, name: 'Nanny Primeira')
    create(:au_pair, name: 'Nanny Segunda')

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: 'Segunda'
    click_on 'Buscar'

    expect(page).to have_content('Nanny Segunda')
    expect(page).not_to have_content('Nanny Primeira')
  end

  scenario 'and filter by name ignoring case' do
    create(:au_pair, name: 'Nanny #10')
    create(:au_pair, name: 'Nanny #9')

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: 'NANNY #10'
    click_on 'Buscar'

    expect(page).to have_content('Nanny #10')
    expect(page).not_to have_content('Nanny #9')
  end

  scenario 'and filter by empty name' do
    create(:au_pair, name: 'Nanny Primeira')
    create(:au_pair, name: 'Nanny Segunda')

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: ''
    click_on 'Buscar'

    expect(page).to have_content('Nanny Primeira')
    expect(page).to have_content('Nanny Segunda')
  end

  scenario 'and filter by skills' do
    create(:au_pair, name: 'Nanny Primeira', skills: 'anti depressiva')
    create(:au_pair, name: 'Nanny Segunda', skills: 'contadora de estórias')

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: 'estórias'
    click_on 'Buscar'

    expect(page).to_not have_content('Nanny Primeira')
    expect(page).to have_content('Nanny Segunda')
  end

  scenario 'and filter by degree' do
    create(:au_pair, name: 'Nanny Primeira', degree: 'formada em psicologia')
    create(:au_pair, name: 'Nanny Segunda', degree: 'formada em pedagogia')

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: 'pedagogia'
    click_on 'Buscar'

    expect(page).to_not have_content('Nanny Primeira')
    expect(page).to have_content('Nanny Segunda')
  end

  scenario 'and filter by city' do
    create(:au_pair, name: 'Nanny Primeira', city: 'Rio de Janeiro')
    create(:au_pair, name: 'Nanny Segunda', city: 'São Paulo')

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: 'são paulo'
    click_on 'Buscar'

    expect(page).to_not have_content('Nanny Primeira')
    expect(page).to have_content('Nanny Segunda')
  end

  scenario 'and filter by languages' do
    create(:au_pair, name: 'Nanny Primeira', languages: 'ingles e italiano')
    create(:au_pair, name: 'Nanny Segunda', languages: 'espanhol')

    visit root_path
    click_on 'Encontre Babás'

    fill_in 'Buscar por', with: 'espanhol'
    click_on 'Buscar'

    expect(page).to_not have_content('Nanny Primeira')
    expect(page).to have_content('Nanny Segunda')
  end
end
