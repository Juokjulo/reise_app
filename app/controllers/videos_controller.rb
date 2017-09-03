class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_filter :check_privileges!, except: [:index, :list_videos]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
    @countries = Country.all
    @path = 'country_videos_path' 
    render 'countries/list', path: @path 
  end

  def list_videos
    if params[:tag]
      @videos = Video.tagged_with(params[:tag])
    else
      @country = Country.find(params[:country])
      @videos = Video.where(country_id: @country).all
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
    if params[:country]
      @country = Country.find(params[:country])
    else
       @country = Country.first
    end
  end

  # GET /videos/1/edit
  def edit
    @country = @video.country
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:public, :name, :description, :url, :country_id, :tag_list, :tag, { tag_ids: [] })
    end
end
