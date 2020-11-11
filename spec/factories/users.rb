FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name}
    end
    user_name             { person.kanji }
    shop_name             { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              = "123456"
    password              { password }
    password_confirmation { password }
  end
end