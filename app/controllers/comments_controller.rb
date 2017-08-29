class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end


  def create
      @commentable = find_commentable
      @comment = @commentable.comments.build(comment_params)
      @comment.user_id = current_user.id

      respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'comment was successfully created.' }
        format.json { render :show, status: :created, location: @commentable }
      else
        format.html { render :new }
        format.json { render json: @commentable.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :content, :email, :commentable, :user_id)
    end
end
