require 'rails_helper'

feature 'User list aupairs' do

  scenario 'successfully' do

    aupair = create(:au_pair)

    expect(aupair.name).to eq(aupair.name)
  end

end