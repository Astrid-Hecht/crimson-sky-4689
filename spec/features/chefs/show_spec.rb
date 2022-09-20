require 'rails_helper'

RSpec.describe 'Chef Show Page', type: :feature do
  describe "As a visitor, When I visit a Chef's show page" do
    let!(:guy) {Chef.create!(name: 'Guy Pierry')}

    let!(:bt) {guy.dishes.create!(name: 'BL(!T)', description: 'delicious lettuce')}
    let!(:bbb) {guy.dishes.create!(name: 'Bacon Baugette Bonanza', description: 'From Paris, the town of flavor')}
    let!(:just_bacon) {guy.dishes.create!(name: 'Bacon', description: 'Huh... its just bacon')}
    
    let!(:bread) {Ingredient.create!(name: 'French Bread', calories: 600)}
    let!(:bacon) {Ingredient.create!(name: 'Bacon (Jamon)', calories: 950)}
    let!(:lettuce) { Ingredient.create!(name: 'Iceberg Lettuce', calories: 5) }

    let!(:bt_recip1) {Recipie.create!(dish_id: bt.id, ingredient_id: bread.id )}
    let!(:bt_recip2) {Recipie.create!(dish_id: bt.id, ingredient_id: bacon.id )}
    let!(:bt_recip3) {Recipie.create!(dish_id: bt.id, ingredient_id: lettuce.id )}
    
    let!(:bbb_recip1) {Recipie.create!(dish_id: bbb.id, ingredient_id: bread.id )}
    let!(:bbb_recip2) {Recipie.create!(dish_id: bbb.id, ingredient_id: bacon.id )}
    

    let!(:just_bacon_recip1) {Recipie.create!(dish_id: just_bacon.id, ingredient_id: bacon.id )}

    before(:each) do
      visit chef_path(guy)
    end

    it "I see the chef's name " do
      within '#name' do
        expect(page).to have_content('Name: ' + guy.name)
      end
    end

    it 'I see the chefs three most freq used ingredients' do
      within '#top_ingr' do
        expect(bacon.name).to appear_before(bread.name)
        expect(bread.name).to appear_before(lettuce.name)
      end
    end

    it 'And I see a link to view a list of all ingredients that this chef uses in their dishes' do
      expect(page).to have_link("Ingredients Used")
    end

    it "When I click on that link I'm taken to a chef's ingredient index page" do
      click_link('Ingredients Used')
      expect(current_path).to eq(chef_ingredients_path(guy))
    end
  end
end