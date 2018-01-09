class BlogController < ApplicationController
before_filter :check_privileges!, except: [:index]
	def index
		@countries = Country.all
		@videos = Video.order('videos.updated_at ASC').all
		@stories = Story.order('stories.updated_at ASC').all
		@latest_news = News.last
		@blog = (Video.all + Story.all).sort{|x,y| x.updated_at <=> y.updated_at}.reverse     
		@last_public_picture = Picture.where(public: true).last
		@last_created_at = @last_public_picture.created_at 
		@last_created_at = @last_created_at.strftime("%Y-%m-%d")
		@pictures = Picture.where(["created_at like ? AND public = ? ", @last_created_at + "%", true] ).all.order(id: :desc).limit(9)
	
	end


end
