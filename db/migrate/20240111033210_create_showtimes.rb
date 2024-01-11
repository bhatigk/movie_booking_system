class CreateShowtimes < ActiveRecord::Migration[7.1]
  def change
    create_table :showtimes do |t|
      t.datetime :timing
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
