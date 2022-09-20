class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingr_used
    Ingredient.joins(:dishes).where(dishes: { chef_id: self.id})
  end
end

# .select('ingredients.id as ingredient_id, ingredients.name')