class TravelTippsController < ApplicationController
  before_action :set_travel_tipp, only: [:show, :edit, :update, :destroy]
  before_filter :check_privileges!, except: [:index, :show, :list_travel_tipps]

  # GET /travel_tipps
  # GET /travel_tipps.json
  def index
    @travel_tipps = TravelTipp.all
    @countries = Country.all
    #@path = 'country_travel_tipps_path' 
    #render 'countries/list', path: @path 
  end

  def list_travel_tipps
    @country = Country.find(params[:country])
    @travel_tipps = TravelTipp.where(country_id: @country).all
  end

  # GET /travel_tipps/1
  # GET /travel_tipps/1.json
  def show
  end

  # GET /travel_tipps/new
  def new
    @travel_tipp = TravelTipp.new
  end

  # GET /travel_tipps/1/edit
  def edit
  end

  # POST /travel_tipps
  # POST /travel_tipps.json
  def create
    @travel_tipp = TravelTipp.new(travel_tipp_params)

    respond_to do |format|
      if @travel_tipp.save
        format.html { redirect_to @travel_tipp, notice: 'Travel tipp was successfully created.' }
        format.json { render :show, status: :created, location: @travel_tipp }
      else
        format.html { render :new }
        format.json { render json: @travel_tipp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_tipps/1
  # PATCH/PUT /travel_tipps/1.json
  def update
    respond_to do |format|
      if @travel_tipp.update(travel_tipp_params)
        format.html { redirect_to @travel_tipp, notice: 'Travel tipp was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_tipp }
      else
        format.html { render :edit }
        format.json { render json: @travel_tipp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_tipps/1
  # DELETE /travel_tipps/1.json
  def destroy
    @travel_tipp.destroy
    respond_to do |format|
      format.html { redirect_to travel_tipps_url, notice: 'Travel tipp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_tipp
      @travel_tipp = TravelTipp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_tipp_params
      params.require(:travel_tipp).permit(:name, :description, :country_id, :public)
    end
end
