FactoryBot.define do
  factory :showtime do
    timing { "09:15 PM" }
    from_date { Date.today }
    to_date { Date.today + 10.days }

    association :theater
    association :movie
  end
end
