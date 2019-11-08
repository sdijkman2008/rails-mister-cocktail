# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'


# puts 'Cleaning database...'
# Cocktail.destroy_all
puts 'Creating list of cocktails'

url_cocktail = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic'
file_cocktail = open(url_cocktail).read
hash_cocktail = JSON.parse(file_cocktail)
array_cocktail = hash_cocktail.flatten[1].map { |hash| hash['strDrink'] }
array_cocktail.each do |cocktail|
  Cocktail.create(name: cocktail)
end

puts 'Finished cocktails!'

puts 'Creating list of ingredients'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
file_ingredient = open(url).read
hash_ingredient = JSON.parse(file_ingredient)
array_ingredient = hash_ingredient.flatten[1].map { |hash| hash['strIngredient1'] }
array_ingredient.each do |ingredient|
  Ingredient.create(name: ingredient)
end

puts 'Finished ingredients!'

puts 'Creating list of dosages'

one_cl = Dose.new(description: '1cl')
one_cl.save!

two_cl = Dose.new(description: '2cl')
two_cl.save!

three_cl = Dose.new(description: '3cl')
three_cl.save!

four_cl = Dose.new(description: '4cl')
four_cl.save!

five_cl = Dose.new(description: '5cl')
five_cl.save!

one_part = Dose.new(description: '1 part')
one_part.save!

two_part = Dose.new(description: '2 part')
two_part.save!

three_part = Dose.new(description: '3 part')
three_part.save!

handfull = Dose.new(description: 'A handful')
handfull.save!

around = Dose.new(description: 'Around the rim')
around.save!

puts 'Finished dosages!'
