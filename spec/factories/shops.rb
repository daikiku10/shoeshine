FactoryBot.define do
  factory :shop do
    shop_name    { Faker::Name.name }
    address      { Faker::Address.street_address }
    instagram    { 'test_test' }
    phone_number { '09012345678'}
    lat          { Faker::Address.latitude }
    lng          { Faker::Address.longitude }
    association :user
  end
end
