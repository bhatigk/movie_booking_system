json.extract! booking, :id, :user_id, :showtime_id, :seat_numbers, :created_at, :updated_at
json.url booking_url(booking, format: :json)
