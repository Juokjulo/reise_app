class BlogController < ApplicationController
before_filter :check_privileges!, except: [:index]
	def index
		@countries = Country.all
		@videos = Video.order('videos.updated_at ASC').all
		@stories = Story.order('stories.updated_at ASC').all
		@latest_news = News.last
		@blog = (Video.all + Story.all).sort{|x,y| x.updated_at <=> y.updated_at}.reverse     
 

	
	end


end
