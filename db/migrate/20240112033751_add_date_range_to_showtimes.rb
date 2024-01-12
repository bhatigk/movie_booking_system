class AddDateRangeToShowtimes < ActiveRecord::Migration[7.1]
  def change
    add_column :showtimes, :from_date, :date
    add_column :showtimes, :to_date, :date
  end
end
