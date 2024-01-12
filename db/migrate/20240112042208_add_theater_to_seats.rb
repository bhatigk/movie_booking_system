class AddTheaterToSeats < ActiveRecord::Migration[7.1]
  def change
    add_reference :seats, :theater, null: false, foreign_key: true
  end
end
