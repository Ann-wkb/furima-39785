Rails.application.routes.draw do
  devise_for :items
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/items/index', to: 'items#index'
  root to: 'items#index'
  resources :items, only: [:index, :new, :create]
end
