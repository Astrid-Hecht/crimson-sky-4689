class Recipie < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
end