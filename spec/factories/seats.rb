FactoryBot.define do
  factory :seat do
    name { "A1" }
    category { "VIP" }
    row { "A" }

    association :theater
  end
end
