class Showtime < ApplicationRecord
  belongs_to :movie
  belongs_to :theater
  has_many :seats
  has_many :bookings
end
