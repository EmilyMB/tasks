require "rails_helper"

RSpec.describe Task, type: :model do
  describe "validations" do
    it { should belong_to(:list) }
    it { should validate_presence_of(:title) }
  end
end
