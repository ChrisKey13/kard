# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
LANGUAGES = ['Dart', 'Elixir', 'Go','Javascript', 'Python', 'Ruby']

p 'destroying previous languages'

Language.destroy_all if Rails.env.development?

p 'languages destroy'

p "creating the languages in"

LANGUAGES.each do |language|
  Language.create!(
    name: language
  )
end
p 'The languages have been created'

