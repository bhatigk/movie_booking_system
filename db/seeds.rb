User.create!(email: "admin@gmail.com", password: "abc123", role: "admin")

movies_data = [
  {
    title: 'The Matrix',
    genre: '1999 ‧ Action/Sci-fi ‧ 2h 16m',
    poster: 'matrix.jpeg'
  },
  {
    title: 'Inception',
    genre: 'Sci-Fi',
    poster: 'inception.jpeg'
  },
  {
    title: 'Yamla Pagla Diwana',
    genre: '2011 ‧ Comedy/Action ‧ 2h 43m',
    poster: 'ypd.jpeg'
  },
  {
    title: 'Animal',
    genre: '2023 ‧ Action/Crime ‧ 3h 21m',
    poster: 'animal.jpg'
  },
  {
    title: 'Marry Christmas',
    genre: '2024 ‧ Thriller/Romance ‧ 2h 25m',
    poster: 'marry_christmas.jpeg'
  },
  {
    title: "Hanu-Man",
    genre: "2024 ‧ Action/Superhero ‧ 2h 30m",
    poster: "hanuman.jpeg"
  }
]

movies_data.each do |movie_data|
  movie = Movie.create!(title: movie_data[:title], genre: movie_data[:genre])
  poster_path = Rails.root.join('public', 'images', movie_data[:poster])
  movie.update(poster: poster_path) if File.exist?(poster_path)
end

theaters_data = [
  { name: 'City Cinema', city: 'New York' },
  { name: 'Downtown Movies', city: 'Los Angeles' },
  { name: 'Cineplex Central', city: 'Chicago' },
  # Add more theaters as needed
]

theaters_data.each do |theater_data|
  Theater.create!(name: theater_data[:name], city: theater_data[:city])
end

movies = Movie.all
theaters = Theater.all

showtimes_data = [
  { timing: '09:00 AM', movie: movies.first, theater: theaters.first, from_date: Date.today, to_date: Date.today + 10.day },
  { timing: '10:15 AM', movie: movies.first, theater: theaters.second, from_date: Date.today, to_date: Date.today + 10.day },
  { timing: '06:00 PM', movie: movies.first, theater: theaters.first, from_date: Date.today, to_date: Date.today + 10.day },
  { timing: '09:00 AM', movie: movies.second, theater: theaters.second, from_date: Date.today, to_date: Date.today + 10.day },
  { timing: '07:30 PM', movie: movies.second, theater: theaters.second, from_date: Date.today, to_date: Date.today + 15.day },
  # Add more showtimes as needed
]

showtimes_data.each do |showtime_data|
  Showtime.create!(timing: showtime_data[:timing],
                  movie: showtime_data[:movie],
                  theater: showtime_data[:theater],
                  from_date: showtime_data[:from_date],
                  to_date: showtime_data[:to_date])
end