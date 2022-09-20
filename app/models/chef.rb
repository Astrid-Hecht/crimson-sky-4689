class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingr_used
    Ingredient.joins(:dishes).where(dishes: { chef_id: self.id}).distinct
  end

  def top_ingr
    Ingredient.joins(:dishes).where(dishes: { chef_id: self.id}).group(:id).order("dishes.count desc").limit(3)
  end
end

# .select('ingredients.id as ingredient_id, ingredients.name')