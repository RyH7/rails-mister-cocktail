# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb
require 'open-uri'
require 'json'
require 'pry'
# open the ingredien list
ingredients_list = open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
# parse the JSON
parsed_ing = JSON.parse(ingredients_list)

parsed_ing["drinks"].each do |ingredient|

  Ingredient.create(name: ingredient["strIngredient1"])
  puts ingredient["strIngredient1"] + "was created"
end
