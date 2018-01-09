class TravelTippsCategoriesController < ApplicationController
  before_action :set_travel_tipps_category, only: [:show, :edit, :update, :destroy]
  before_filter :check_privileges!

  # GET /travel_tipps_categories
  # GET /travel_tipps_categories.json
  def index
    @travel_tipps_categories = TravelTippsCategory.all
  end

  # GET /travel_tipps_categories/1
  # GET /travel_tipps_categories/1.json
  def show
  end

  # GET /travel_tipps_categories/new
  def new
    @travel_tipps_category = TravelTippsCategory.new
  end

  # GET /travel_tipps_categories/1/edit
  def edit
  end

  # POST /travel_tipps_categories
  # POST /travel_tipps_categories.json
  def create
    @travel_tipps_category = TravelTippsCategory.new(travel_tipps_category_params)

    respond_to do |format|
      if @travel_tipps_category.save
        format.html { redirect_to @travel_tipps_category, notice: 'Travel tipps category was successfully created.' }
        format.json { render :show, status: :created, location: @travel_tipps_category }
      else
        format.html { render :new }
        format.json { render json: @travel_tipps_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_tipps_categories/1
  # PATCH/PUT /travel_tipps_categories/1.json
  def update
    respond_to do |format|
      if @travel_tipps_category.update(travel_tipps_category_params)
        format.html { redirect_to @travel_tipps_category, notice: 'Travel tipps category was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_tipps_category }
      else
        format.html { render :edit }
        format.json { render json: @travel_tipps_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_tipps_categories/1
  # DELETE /travel_tipps_categories/1.json
  def destroy
    @travel_tipps_category.destroy
    respond_to do |format|
      format.html { redirect_to travel_tipps_categories_url, notice: 'Travel tipps category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_tipps_category
      @travel_tipps_category = TravelTippsCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_tipps_category_params
      params.require(:travel_tipps_category).permit(:name)
    end
end
