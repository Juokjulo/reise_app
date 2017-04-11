Rails.application.routes.draw do
  resources :travel_tipps
  resources :countries
  resources :materials
  resources :material_categories
  resources :storytexts
  resources :stories
  resources :pictures
  resources :newsletters
  root to: 'visitors#index'
  get "list_stories/:country" => "stories#list_stories", :as => "list_stories"
  get "list_pictures/:country" => "pictures#list_pictures", :as => "list_pictures"
  get "list_travel_tipps/:country" => "travel_tipps#list_travel_tipps", :as => "list_travel_tipps"
  devise_for :users
  resources :users
  resources :stories, shallow: true do
  	resources :storytexts
  end
  resources :countries, shallow: true do
    resources :stories
    resources :pictures
    resources :travel_tipps
  end
end
