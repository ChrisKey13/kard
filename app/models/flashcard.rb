class Flashcard < ApplicationRecord
  belongs_to :list
  belongs_to :language
  has_one_attached :photo
  validates :title, presence: :true
  validates :content, presence: :true

  def self.upload(photo)
    Cloudinary::Uploader.upload(photo)
  end

  def self.perform_search(keyword)
    if keyword.present?
    then Flashcard.search(keyword)
    else Flashcard.all
    end.sorted
  end
end
