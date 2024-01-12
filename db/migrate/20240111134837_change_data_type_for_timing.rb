class ChangeDataTypeForTiming < ActiveRecord::Migration[7.1]
  def change
    change_column :showtimes, :timing, :string
  end
end
