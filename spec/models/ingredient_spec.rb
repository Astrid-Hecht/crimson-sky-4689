require "rails_helper"

RSpec.describe Ingredient, type: :model do
  describe "relationships" do
    it { should have_many :dishes}
    it { should have_many(:dishes).through(:recipies) }
  end
end