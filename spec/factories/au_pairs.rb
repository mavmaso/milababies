FactoryBot.define do
  factory :au_pair do
    sequence(:name) { |n| "Nanny ##{n}" }
    email 'nanny@baba.com'
    phone '99988-1234'
    social_media 'facebook.com/nannybaba'
    CPF '54545199011'
    skills 'Brincadeiras educativas'
    degree 'Segundo grau completo'
    languages 'Portugues, Ingles'
    birth_date '1993-04-19'
    city 'Londrina'
    rate 10
    photo File.new(Rails.root.join('spec', 'support', 'nophoto.jpg'))
  end
end
