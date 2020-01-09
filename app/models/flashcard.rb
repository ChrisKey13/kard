class Flashcard < ApplicationRecord
  belongs_to :list
  belongs_to :language
  has_one_attached :photo
  validates :title, presence: :true
  validates :content, presence: :true
end
