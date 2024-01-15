FactoryBot.define do
  factory :movie do
    title { "The Matrix" }
    genre { "2011 ‧ Comedy/Action" }

    transient do
      poster_path { "#{Rails.root}/public/images/matrix.jpeg" }
    end

    poster do
      Rack::Test::UploadedFile.new(
        File.open(poster_path)
      )
    end
  end
end
