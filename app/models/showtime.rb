class Showtime < ApplicationRecord
  belongs_to :movie
  belongs_to :theater
  has_many :bookings, dependent: :destroy

  validates :timing, presence: true, uniqueness: { scope: :theater }
  validates :from_date, :to_date, presence: true
  validate :validate_date_range

  def available_dates
    (from_date..to_date).to_a
  end

  private

  def validate_date_range
    errors.add(:base, "Invalid date range") if from_date.present? && to_date.present? && from_date > to_date
  end
end
