require "rails_helper"

RSpec.describe Booking, type: :model do
  subject { FactoryBot.build(:booking) }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:showtime) }
  end
end
