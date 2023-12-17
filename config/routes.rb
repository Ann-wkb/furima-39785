Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'items#index'
  get '/items/index', to: 'items#index'
  resources :items, only: [:index, :new, :create]

  resources :articles
end
