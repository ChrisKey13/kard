# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# file = URI.open('https://commons.wikimedia.org/wiki/File:NASA-Apollo8-Dec24-Earthrise.jpg#/media/File:NASA-Apollo8-Dec24-Earthrise.jpg')

LANGUAGES = ['Dart', 'Elixir', 'Go', 'Javascript', 'Python', 'Ruby']

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

List.destroy_all if Rails.env.development?
Flashcard.destroy_all if Rails.env.development?
p "Creating 5 Lists"
TITLE = ["Learning Dart", "Getting Better at Rails", "Mastering Ruby", "JS Love", "Python for Machine Learning"]
DESCRIPTION = ["It's important to let the Feeling Brain air out all its icky, twisted feelings. Just get them out into the open where they can bring"]
TITLE.each do |title|
  List.create!(
    title: title,
    description: DESCRIPTION[0.to_i]
  )
end
p '5 Lists have been created'
p 'Now Creating a random number of flashcards for Lists'
  List.all.each do |list|
    rand(10).times do
      flash = Flashcard.create!(
        title: Faker::ProgrammingLanguage.name,
        content: Faker::TvShows::BojackHorseman.quote,
        list_id: list.id,
        language_id: Language.first.id
      )
      # flash.photo.attach(io: 'https://commons.wikimedia.org/wiki/File:NASA-Apollo8-Dec24-Earthrise.jpg#/media/File:NASA-Apollo8-Dec24-Earthrise.jpg', filename: 'nes.png', content_type: 'image/png')
    end
end
