Rails.application.routes.draw do

  
  devise_for :users
  root "trips#index"
  resources :trips
  resources :locations
  resources :addresses


end
