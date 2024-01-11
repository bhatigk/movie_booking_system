class AddTheaterToShowTimes < ActiveRecord::Migration[7.1]
  def change
    add_reference :showtimes, :theaters, null: false, foreign_key: true
  end
end
