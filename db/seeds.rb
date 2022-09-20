# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

guy = Chef.create!(name: 'Guy Pierry')
bbb = guy.dishes.create!(name: 'Bacon Baugette Bonanza', description: 'From Paris, the town of flavor')
bread = Ingredient.create!(name: 'French Bread', calories: 600)
bacon = Ingredient.create!(name: 'Bacon (Jamon)', calories: 950)
Ingredient.create!(name: 'Iceberg Lettuce', calories: 5)
Recipie.create!(dish_id: bbb.id, ingredient_id: bread.id)
Recipie.create!(dish_id: bbb.id, ingredient_id: bacon.id)