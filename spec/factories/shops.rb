FactoryBot.define do
  factory :shop do
    address      { Faker::Address.street_address }
    instagram    { 'test_test' }
    phone_number { '09012345678'}
    lat          { Faker::Address.latitude }
    lng          { Faker::Address.longitude }
    association :user
  end
end
