require 'rails_helper'

feature 'User send testimonial' do
  scenario 'successfully' do
    create(:au_pair, name: 'Nanny')
    florinda = create(:user)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: florinda.email
    fill_in 'Senha', with: florinda.password
    click_on 'Logar'

    click_on 'Encontre Babás'
    click_on 'Ver Mais'
    click_on 'Criar depoimento'
    fill_in 'Título', with: 'Muito Bom'
    fill_in 'Descrição', with: 'Gostei bastante'
    click_on 'Salvar'

    expect(page).to have_content('Muito Bom')
    testimonial = Testimonial.last
    expect(testimonial.user.email).to eq florinda.email
  end

  scenario 'and leaves blanks fields' do
    create(:au_pair, name: 'Nanny')
    florinda = create(:user)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: florinda.email
    fill_in 'Senha', with: florinda.password
    click_on 'Logar'

    click_on 'Encontre Babás'
    click_on 'Ver Mais'
    click_on 'Criar depoimento'
    fill_in 'Título', with: ''
    fill_in 'Descrição', with: ''
    click_on 'Salvar'
    expect(page).to have_content('Você deve preencher todos os campos')
  end

  scenario 'and do rating', :js do
    au_pair = create(:au_pair, name: 'Nanny')
    florinda = create(:user)

    visit new_user_session_path
    fill_in 'Email', with: florinda.email
    fill_in 'Senha', with: florinda.password
    click_on 'Logar'

    visit new_au_pair_testimonial_path(au_pair)
    fill_in 'Título', with: 'Muito Bom'
    fill_in 'Descrição', with: 'Gostei bastante'
    find('img[title="gorgeous"]').click
    click_on 'Salvar'

    expect(page).to have_content('Muito Bom')
    expect(page).to have_content('Avaliação: 5.0')
  end

  scenario 'unlogged' do
    create(:au_pair, name: 'Nanny')

    visit root_path

    click_on 'Encontre Babás'
    click_on 'Ver Mais'
    click_on 'Criar depoimento'

    expect(current_path).to eq new_user_session_path
  end
end
