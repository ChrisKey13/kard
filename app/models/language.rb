class Language < ApplicationRecord
    LANGUAGES = ['Dart', 'Elixir', 'Go','Javascript', 'Python', 'Ruby']
    has_many :flashcards, dependent: :destroy
    validates :name, inclusion: { in: LANGUAGES }
end
