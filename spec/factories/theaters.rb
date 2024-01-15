FactoryBot.define do
  factory :theater do
    name { Faker::Company.name }
    city { Faker::Address.city }
  end
end
