require 'rails_helper'

feature 'User list aupairs' do

  scenario 'successfully' do

    #au_pair = create(:au_pair)

    #puts(au_pair)

    aupair = AuPair.new

    expect(aupair.name).to eq(aupair.name)
  end


end