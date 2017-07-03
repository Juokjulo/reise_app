Rails.application.routes.draw do
  resources :tags, except: :show
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
  resources :stories, shallow: true do
  	resources :storytexts
  end
  resources :countries, shallow: true do
    resources :stories
    resources :pictures
    resources :videos
    resources :travel_tipps
  end
  get 'tags/:tag,:country', to: 'stories#list_stories', :as => "list_stories_tag"

end
