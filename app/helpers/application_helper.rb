module ApplicationHelper
  def fetch_time_options
    Array.new(24.hours / 15.minutes) do |i|
      (Time.now.midnight + (i * 15.minutes)).strftime("%I:%M %p")
    end
  end

  def fetch_showtimes_by_movie(movie)
    movie.showtimes.group_by(&:theater)
  end
end
