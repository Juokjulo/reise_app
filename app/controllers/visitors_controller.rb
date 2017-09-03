class VisitorsController < ApplicationController
 def index
    @news = News.order('news.id DESC').all
  end

end
