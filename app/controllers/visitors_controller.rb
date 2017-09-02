class VisitorsController < ApplicationController
 def index
    @news = News.all
  end

end
