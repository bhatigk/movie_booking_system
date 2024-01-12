class Seat < ApplicationRecord
  belongs_to :theater

  validates :name, :category, :row, presence: true
end
