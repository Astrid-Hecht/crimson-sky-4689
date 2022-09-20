require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end
  describe "relationships" do
    it { should have_many :dishes }
  end

  let!(:guy) { Chef.create!(name: 'Guy Pierry') }
  let!(:bbb) { guy.dishes.create!(name: 'Bacon Baugette Bonanza', description: 'From Paris, the town of flavor') }
  let!(:bread) { Ingredient.create!(name: 'French Bread', calories: 600) }
  let!(:bacon) { Ingredient.create!(name: 'Bacon (Jamon)', calories: 950) }
  let!(:lettuce) { Ingredient.create!(name: 'Iceberg Lettuce', calories: 5) }
  let!(:bbb_recip1) { Recipie.create!(dish_id: bbb.id, ingredient_id: bread.id) }
  let!(:bbb_recip2) { Recipie.create!(dish_id: bbb.id, ingredient_id: bacon.id) }

  describe 'instance methods' do
    describe '#ingr_used' do
      it 'returns a list of used ingredients' do
        expect(guy.ingr_used).to eq([bread, bacon])
      end

      it 'doesnt return unused ones' do
        excpect(guy.ingr_used.include?(lettuce)).to be(false)
      end

    end
  end
end