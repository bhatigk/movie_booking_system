class CreateSeats < ActiveRecord::Migration[7.1]
  def change
    create_table :seats do |t|
      t.string :name
      t.string :category
      t.string :row
      t.references :showtime, null: false, foreign_key: true
      t.boolean :booked

      t.timestamps
    end
  end
end
