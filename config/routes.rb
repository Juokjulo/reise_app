Rails.application.routes.draw do
  resources :storytexts
  resources :stories
  resources :pictures
  resources :newsletters
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :stories, shallow: true do
  	resources :storytexts
  end
end
