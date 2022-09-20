require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end
  describe "relationships" do
    it { should have_many :dishes }
  end
  
  let!(:guy) {Chef.create!(name: 'Guy Pierry')}
  
  let!(:bt) {guy.dishes.create!(name: 'BL(!T)', description: 'delicious lettuce')}
  let!(:bbb) {guy.dishes.create!(name: 'Bacon Baugette Bonanza', description: 'From Paris, the town of flavor')}
  let!(:just_bacon) {guy.dishes.create!(name: 'Bacon', description: 'Huh... its just bacon')}
  
  let!(:bread) {Ingredient.create!(name: 'French Bread', calories: 600)}
  let!(:bacon) {Ingredient.create!(name: 'Bacon (Jamon)', calories: 950)}
  let!(:lettuce) { Ingredient.create!(name: 'Iceberg Lettuce', calories: 5) }
  let!(:tomato) { Ingredient.create!(name: 'Tomato', calories: 5) }

  let!(:bt_recip1) {Recipie.create!(dish_id: bt.id, ingredient_id: bread.id )}
  let!(:bt_recip2) {Recipie.create!(dish_id: bt.id, ingredient_id: bacon.id )}
  let!(:bt_recip3) {Recipie.create!(dish_id: bt.id, ingredient_id: lettuce.id )}
  
  let!(:bbb_recip1) {Recipie.create!(dish_id: bbb.id, ingredient_id: bread.id )}
  let!(:bbb_recip2) {Recipie.create!(dish_id: bbb.id, ingredient_id: bacon.id )}
  

  let!(:just_bacon_recip1) {Recipie.create!(dish_id: just_bacon.id, ingredient_id: bacon.id )}

  describe 'instance methods' do
    describe '#ingr_used' do
      it 'returns a list of used ingredients' do
        expect(guy.ingr_used).to eq([bread, bacon, lettuce])
      end

      it 'doesnt return unused ones' do
        expect(guy.ingr_used.include?(tomato)).to be(false)
      end

    end

    describe '#top_ingr' do
      it 'returns list of used ingr by frequency' do
        expect(guy.top_ingr).to eq([bacon, bread, letuce])
      end
    end

  end
end