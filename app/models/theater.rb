class Theater < ApplicationRecord
  has_many :showtimes, dependent: :destroy
  has_many :seats, dependent: :destroy

  after_create :create_seat

  private

  def create_seat
    ("A".."H").each do |row|
      (1..10).each do |number|
        category = if row == "A"
                     "VIP"
                   elsif row >= "B" && row <= "F"
                     "Royal"
                   else
                     "Premium"
                   end

        seats.create(name: "#{row}#{number}", category: category, row: row)
      end
    end
  end
end
