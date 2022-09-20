require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :recipies }
    it { should have_many(:ingredients).through(:recipies) }
  end

  let!(:guy) {Chef.create!(name: 'Guy Pierry')}
  let!(:bbb) {guy.dishes.create!(name: 'Bacon Baugette Bonanza', description: 'From Paris, the town of flavor')}
  let!(:bread) {Ingredient.create!(name: 'French Bread', calories: 600)}
  let!(:bacon) {Ingredient.create!(name: 'Bacon (Jamon)', calories: 950)}
  let!(:bbb_recip1) {Recipie.create!(dish_id: bbb.id, ingredient_id: bread.id )}
  let!(:bbb_recip2) {Recipie.create!(dish_id: bbb.id, ingredient_id: bacon.id )}

  describe 'instance methods' do
    describe '#tot_cal' do
      it 'sums calories for a dish' do
        expect(bbb.tot_cal).to eq(1550)
      end
    end
  end
end