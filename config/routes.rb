Rails.application.routes.draw do
  resources :materials
  resources :material_categories
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
