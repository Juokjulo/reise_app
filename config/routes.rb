Rails.application.routes.draw do
  resources :pictures
  resources :newsletters
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
