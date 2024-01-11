class Showtime < ApplicationRecord
  belongs_to :movie
  has_many :seats
  has_many :bookings
end
