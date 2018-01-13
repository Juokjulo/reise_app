Rails.application.routes.draw do
  resources :travel_tipps_categories
  resources :travel_tipps, shallow: true do
    resources :travel_tipps_segments
  end
  resources :news
  resources :routes
  get 'comments/index'
  get 'comments/new'
  resources :stories, :pictures, :countries, :videos, :travel_tipps, :materials, shallow: true do
    resources :comments, :only => [:create, :update, :destroy]
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
  root to: 'blog#index'
  get "pictures/new/:country" => "pictures#new", :as => "new_picture_country" 
  get "stories/new/:country" => "stories#new", :as => "new_story_country" 
  get "videos/new/:country" => "videos#new", :as => "new_video_country" 
  get "list_stories/:country" => "stories#list_stories", :as => "list_stories"
  get "list_pictures/:country" => "pictures#list_pictures", :as => "list_pictures"
  get "list_pictures_text/:country" => "pictures#list_pictures_text", :as => "list_pictures_text"
  get "list_videos/:country" => "videos#list_videos", :as => "list_videos"
  get "list_travel_tipps/:country" => "travel_tipps#list_travel_tipps", :as => "list_travel_tipps"
  get "list_travel_tipps_category/:travel_tipps_category" => "travel_tipps#list_travel_tipps", :as => "list_travel_tipps_category"
  devise_for :users
  resources :users
  get "reset_password/:userid" => "users#reset_password", :as => "reset_password"
  patch "update_password/:userid" => "users#update_password", :as => "update_password"
  get "newsletters/send/:newsletter" => "newsletters#send_new", :as => "send_newsletter"

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
  get 'list_pictures_text_tags/:tag', to: 'pictures#list_pictures_text', :as => "list_pictures_text_tags"
  get 'blog', to: 'blog#index', :as => "blog"
  get 'list_stories_date/:date', to: 'stories#list_stories', :as => "list_stories_date"
  get 'list_videos_date/:date', to: 'videos#list_videos', :as => "list_videos_date"
  get 'list_pictures_date/:date', to: 'pictures#list_pictures', :as => "list_pictures_date"
  get 'list_pictures_text_date/:date', to: 'pictures#list_pictures_text', :as => "list_pictures_text_date"

end
