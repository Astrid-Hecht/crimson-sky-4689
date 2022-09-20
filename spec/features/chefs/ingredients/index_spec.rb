require 'rails_helper'

RSpec.describe 'Chef Ingredients Index Page', type: :feature do
  describe "As a visitor, When I visit a Chef's show page" do
    let!(:guy) { Chef.create!(name: 'Guy Pierry') }
    let!(:bbb) { guy.dishes.create!(name: 'Bacon Baugette Bonanza', description: 'From Paris, the town of flavor') }
    let!(:bread) { Ingredient.create!(name: 'French Bread', calories: 600) }
    let!(:bacon) { Ingredient.create!(name: 'Bacon (Jamon)', calories: 950) }
    let!(:lettuce) { Ingredient.create!(name: 'Iceberg Lettuce', calories: 5) }
    let!(:bbb_recip1) { Recipie.create!(dish_id: bbb.id, ingredient_id: bread.id) }
    let!(:bbb_recip2) { Recipie.create!(dish_id: bbb.id, ingredient_id: bacon.id) }

    before(:each) do
      visit chef_ingredients_path(guy)
    end

    it 'I can see a unique list of names of all the ingredients that this chef uses.' do
      within '#ingr_arsenal' do
        guy.used_ingredients.each do |ingredient|
          expect(page).to have_content(ingredient.name)
        end
      end
    end
  end
end
