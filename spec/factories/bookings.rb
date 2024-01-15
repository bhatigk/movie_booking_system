FactoryBot.define do
  factory :booking do
    seat_numbers { [1, 2, 3] }

    association :user
    association :showtime
  end
end
