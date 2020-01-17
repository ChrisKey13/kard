class List < ApplicationRecord
  has_many :flashcards, dependent: :destroy
  include AlgoliaSearch

  algoliasearch per_environment: true do
     # the list of attributes sent to Algolia's API
     attribute :title, :description, :created_at

     # integer version of the created_at datetime field, to use numerical filtering
     attribute :created_at_i do
       created_at.to_i
      end
    end
  def self.perform_search(keyword)
    if keyword.present?
    then List.search(keyword)
    else List.all
    end.sorted
  end
end
