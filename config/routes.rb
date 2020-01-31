Rails.application.routes.draw do
  root 'products#index'
  
  get 'products/filter' => "products#filter"
  devise_for :users
  resources :products

end
