require 'rails_helper'

RSpec.describe Recipie, type: :model do
  describe "relationships" do
    it {should belong_to :dish}
    it {should belong_to :ingredient}
  end
end