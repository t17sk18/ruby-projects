Rails.application.routes.draw do
  get 'information/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'admin/stats'
  devise_for :users
  root 'products#index'
  get 'players/index'
  get 'information/index'
  get 'livetennisnews/news'
  get 'orders/cart'
  get 'orders/viewcart'
  get 'orders/updatecart'
  get 'orders/checkout'
  get 'orders/orders'


  get '/users/password/edit' => 'devise/passwords#edit', as: 'passwordEdit'
  resources :products
  resources :matchstats
  resources :matches
  resources :players
  resources :carts 
  resources :orders
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
