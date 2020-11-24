
Rails.application.routes.draw do
  resources :line_items
  resources :carts
  devise_for :users
  resources :products
  root 'products#index'
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'

  end

end
