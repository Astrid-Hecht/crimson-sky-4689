require 'rails_helper'

RSpec.describe 'Chef Show Page', type: :feature do
  describe "As a visitor, When I visit a Chef's show page" do
    let!(:guy) {Chef.create!(name: 'Guy Pierry')}
    let!(:bbb) {guy.dishes.create!(name: 'Bacon Baugette Bonanza', description: 'From Paris, the town of flavor')}
    let!(:bread) {Ingredient.create!(name: 'French Bread', calories: 600)}
    let!(:bacon) {Ingredient.create!(name: 'Bacon (Jamon)', calories: 950)}
    let!(:bbb_recip1) {Recipie.create!(dish_id: bbb.id, ingredient_id: bread.id )}
    let!(:bbb_recip2) {Recipie.create!(dish_id: bbb.id, ingredient_id: bacon.id )}

    before(:each) do
      visit chef_path(guy)
    end

    it "I see the chef's name " do
      within '#name' do
        expect(page).to have_content(bbb.name)
      end
    end

    it 'And I see a link to view a list of all ingredients that this chef uses in their dishes' do
      expect(page).to have_link("Ingredients Used")
      # within '#ingr_arsenal' do
      #   guy.used_ingredients.each do |ingredient|
      #     expect(page).to have_content(ingredient.name)
      #   end
      # end
    end

    it "When I click on that link I'm taken to a chef's ingredient index page" do
      click_link('Ingredients Used')
      expect(current_path).to eq(chef_ingredients_path(guy))
    end
  end
end