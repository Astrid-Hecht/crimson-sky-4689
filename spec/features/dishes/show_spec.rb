require 'rails_helper'

RSpec.describe 'Dish Show Page', type: :feature do
  describe "As a visitor, When I visit a dish's show page" do
    let!(:guy) {Chef.create!(name: 'Guy Pierry')}
    let!(:bbb) {guy.dishes.create!(name: 'Bacon Baugette Bonanza', description: 'From Paris, the town of flavor')}
    let!(:bread) {Ingredient.create!(name: 'French Bread', calories: 600)}
    let!(:bacon) {Ingredient.create!(name: 'Bacon (Jamon)', calories: 950)}
    let!(:bbb_recip1) {Recipie.create!(dish_id: bbb.id, ingredient_id: bread.id )}
    let!(:bbb_recip2) {Recipie.create!(dish_id: bbb.id, ingredient_id: bacon.id )}

    before(:each) do
      visit dish_path(bbb)
    end

    it 'I see the dish’s name and description' do
      within '#name' do
        expect(page).to have_content('Name: ' + bbb.name)
      end
      within '#descript' do
        expect(page).to have_content('Description: ' + bbb.description)
      end
    end

    it 'And I see a list of ingredients for that dish' do
      within '#ingredients' do
        expect(page).to have_content(bread.name)
        expect(page).to have_content(bacon.name)
      end
    end

    it "And I see the chef's name" do
      within '#chef' do
        expect(page).to have_content('Chef: ' + guy.name)
      end
    end

    it 'and I see the total calorie count for that dish' do 
      within '#calories' do
        expect(page).to have_content('Total calories: ' + bbb.tot_cal.to_s)
      end
    end

  end
end