require "rails_helper"

RSpec.describe Movie, type: :model do
  subject { FactoryBot.build(:movie) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a description" do
      subject.genre = nil
      expect(subject).to_not be_valid
    end
  end
end
