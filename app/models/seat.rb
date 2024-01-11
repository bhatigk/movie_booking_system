class Seat < ApplicationRecord
  belongs_to :showtime

  validates :name, :category, :row, presence: true
  validates :booked, inclusion: { in: [true, false] }

  scope :available, -> { where(booked: false) }
end
