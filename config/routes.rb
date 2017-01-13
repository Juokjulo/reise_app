Rails.application.routes.draw do
  resources :newsletters
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
