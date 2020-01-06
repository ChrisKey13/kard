class List < ApplicationRecord
  has_many :flashcards
  validates :title, presence: :true, uniqueness: :true
end
