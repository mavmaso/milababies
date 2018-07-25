FactoryBot.define do
  factory :proposal do
    booked_date '2018-07-23'
    start_hour '2018-07-23 20:00:06'
    end_hour '2018-07-23 21:00:06'
    message 'MyText'
    au_pair
  end
end
