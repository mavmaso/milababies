FactoryBot.define do
  factory :user do
    email 'florinda@chaves.com'
    password 'tesouro123'
    main_responsible 'Florinda'
    second_responsible 'Professor Girafales'
    main_phone '11 99876-1234'
    second_phone '11 99989-9876'
    city 'Londrina'
  end
end
