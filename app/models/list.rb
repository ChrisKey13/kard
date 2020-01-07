class List < ApplicationRecord
  has_many :flashcards, dependent: :destroy
  validates :title, presence: :true, uniqueness: :true
end
