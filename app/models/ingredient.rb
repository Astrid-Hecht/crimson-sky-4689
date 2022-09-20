class Ingredient < ApplicationRecord
  validates_presence_of :name, :calories
  has_many :recipies
  has_many :dishes, through: :recipies
end