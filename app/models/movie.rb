class Movie < ApplicationRecord
  has_many :showtimes
  has_one_attached :poster
end
