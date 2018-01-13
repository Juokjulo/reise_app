class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_filter :check_privileges!, except: [:index]

  def index
    @comments = Comment.all.reverse
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

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.commentable, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment.commentable }
      else
        format.html { render :edit }
        format.json { render json: @comment.commentable.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.commentable, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

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
