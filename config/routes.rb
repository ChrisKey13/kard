Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "lists#index"
  resources :lists do
    resources :flashcards, only: [:create, :edit]
  end
  resources :flashcards, only: [:destroy]
  #   resources :doses, only: [:create]
  #   resources :reviews, only: [:create]
  # end
  # resources :doses, only: [:destroy]
end
