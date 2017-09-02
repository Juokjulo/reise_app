Rails.application.routes.draw do
  resources :news
  get 'comments/index'
  get 'comments/new'
  resources :stories, :pictures, :countries, :videos, :travel_tipps, :materials, shallow: true do
    resources :comments, :only => [:create, :destroy]
  end
  resources :tags
  resources :videos
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
  get "list_videos/:country" => "videos#list_videos", :as => "list_videos"
  get "list_travel_tipps/:country" => "travel_tipps#list_travel_tipps", :as => "list_travel_tipps"
  devise_for :users
  resources :users
  get "reset_password/:userid" => "users#reset_password", :as => "reset_password"
  patch "update_password/:userid" => "users#update_password", :as => "update_password"

  resources :stories, shallow: true do
  	resources :storytexts
  end
  resources :countries, shallow: true do
    resources :stories
    resources :pictures
    resources :videos
    resources :travel_tipps
  end
  get 'list_stories_tags/:tag', to: 'stories#list_stories', :as => "list_stories_tags"
  get 'list_videos_tags/:tag', to: 'videos#list_videos', :as => "list_videos_tags"
  get 'list_pictures_tags/:tag', to: 'pictures#list_pictures', :as => "list_pictures_tags"


end
