class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_filter :check_privileges!, except: [:index, :show, :list_stories]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all
    @countries = Country.all
    @path = 'country_stories_path' 
    @tags = Story.tag_counts_on(:tags)
    render 'countries/list', path: @path 
  end

  def list_stories
    if params[:tag]
      @stories = Story.tagged_with(params[:tag])
    else
      @country = Country.find(params[:country])
      @stories = Story.where(country_id: @country).all
    end
  end
 
  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

 

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :short_description, :public, :country_id, :picture_id, :user_id, :tag_list, :tag, { tag_ids: [] }, storytexts_attributes: [ :title, :storypart, :id, :_destroy, storytext_pictures_attributes: [ :options, :size, :id, :picture_id, :_destroy ]])
    end
end
