
Rails.application.routes.draw do
  resources :line_items
  resources :carts
  devise_for :users
  resources :products
  get 'home/index'
  root 'products#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
