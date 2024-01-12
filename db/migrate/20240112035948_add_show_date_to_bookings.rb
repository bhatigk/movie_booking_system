class AddShowDateToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :show_date, :date
  end
end
