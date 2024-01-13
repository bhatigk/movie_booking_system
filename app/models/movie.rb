class Movie < ApplicationRecord
  has_many :showtimes
  has_one_attached :poster

  validates :title, :genre, presence: true
end
