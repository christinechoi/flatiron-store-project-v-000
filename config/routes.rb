Rails.application.routes.draw do

  devise_for :users , skip: [:sessions]
  as :user do
    get '/users/sign_in', to: 'devise/sessions#new', as: :new_user_session
    post '/users/sign_in', to: 'devise/sessions#create', as: :user_session
    delete '/', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root 'store#index', as: 'store'

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :users, only: [:show]
  resources :carts
  resources :line_items, only: [:create]
  resources :orders, only: [:show]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end
