class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_filter :check_privileges!, except: [:index, :show, :list_pictures]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
    @countries = Country.all
    @path = 'country_pictures_path' 
    @tags = Picture.where(public: true).tag_counts_on(:tags)
    render 'countries/list', path: @path 
  end

  def list_pictures
    if params[:tag]
      @pictures = Picture.tagged_with(params[:tag])
    else
      @country = Country.find(params[:country])
      @pictures = Picture.where(country_id: @country).all
    end

  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @commentable = @picture
    @comments = @commentable.comments
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
    if params[:country]
      @country = Country.find(params[:country])
    else
       @country = Country.first
    end
 
  end

  # GET /pictures/1/edit
  def edit
      @country = @picture.country
  end

  # POST /pictures
  # POST /pictures.json
  def create
    saved = false
    i = 1
    params[:picture_images]['images'].each do |image|
      @picture = Picture.new(picture_params)
      @picture.image = image
      
      if params[:picture_images]['images'].count > 1
        @picture.name += " " + i.to_s
      end

      if @picture.save
        saved = true
      else
        saved = false
      end
      i += 1
    end

    respond_to do |format|
      if saved
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    @picture.image = params[:picture_images]['images'].first 
    
    respond_to do |format|

      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:name, :description, :image, :country_id, :public, :tag_list, :tag, { tag_ids: [] })
    end
end
