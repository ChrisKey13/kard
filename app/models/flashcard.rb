class Flashcard < ApplicationRecord
  belongs_to :list
  belongs_to :language
  validates :title, presence: :true
  validates :content, presence: :true
end
