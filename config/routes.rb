
Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'products#index'
  put 'line_items/:id/add', to: 'line_items#add_quantity', as: 'add_quantity'
  put 'line_items/:id/remove', to: 'line_items#remove_quantity', as: 'remove_quantity'
  resources :line_items, only: [:create, :update, :destroy]
  resources :carts, only: [:show, :create, :update ]
  devise_for :users
  resources :users, only: [:show, :update, :edit]
  resources :products, only: [:index, :show, :update, :destroy]
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'

  end

  get 'home/index'
  get 'home/about', as: 'about'
  get 'home/contact', as: 'contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
