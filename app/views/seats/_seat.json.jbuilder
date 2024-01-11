json.extract! seat, :id, :name, :category, :row, :showtime_id, :booked, :created_at, :updated_at
json.url seat_url(seat, format: :json)
