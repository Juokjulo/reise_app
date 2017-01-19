class StorytextsController < ApplicationController
  before_action :set_storytext, only: [:show, :edit, :update, :destroy]
  before_filter :check_privileges!
  # GET /storytexts
  # GET /storytexts.json
  def index
    @storytexts = Storytext.all
  end

  # GET /storytexts/1
  # GET /storytexts/1.json
  def show
  end

  # GET /storytexts/new
  def new
    @storytext = Storytext.new
    if params[:story_id]
      @storytext.story_id = params[:story_id]
    end
  end

  # GET /storytexts/1/edit
  def edit
  end

  # POST /storytexts
  # POST /storytexts.json
  def create
    @storytext = Storytext.new(storytext_params)
    @storytext.story = Story.find { params[:story_id] }
    respond_to do |format|
      if @storytext.save
        format.html { redirect_to @storytext, notice: 'Storytext was successfully created.' }
        format.json { render :show, status: :created, location: @storytext }
      else
        format.html { render :new }
        format.json { render json: @storytext.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storytexts/1
  # PATCH/PUT /storytexts/1.json
  def update
    
    respond_to do |format|
      if @storytext.update(storytext_params)
        format.html { redirect_to @story, notice: 'Storytext was successfully updated.' }
        format.json { render :show, status: :ok, location: @storytext }
      else
        format.html { render :edit }
        format.json { render json: @storytext.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storytexts/1
  # DELETE /storytexts/1.json
  def destroy
    @storytext.destroy
    respond_to do |format|
      format.html { redirect_to storytexts_url, notice: 'Storytext was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storytext
      @storytext = Storytext.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def storytext_params
      params.require(:storytext).permit(:title, :storypart, :story_id)
    end
end
