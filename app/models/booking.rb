class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :showtime

  delegate :theater, :movie, to: :showtime

  def theater_name
    "#{theater.name}, #{theater.city}"
  end

  def movie_title
    movie.title
  end

  def booking_info
    "#{movie_title} - In #{theater_name} - At #{show_date.strftime('%a, %d %b %Y')} / #{showtime.timing}"
  end

  def alloted_seat_numbers
    Seat.where(id: seat_numbers).pluck(:name).join(", ")
  end
end
