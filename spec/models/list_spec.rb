require "rails_helper"

RSpec.describe List, type: :model do
  describe "validations" do
    it { should have_many(:tasks) }
    it { should validate_presence_of(:title) }
  end
end
