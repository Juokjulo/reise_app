class AddCategoryToTravelTipps < ActiveRecord::Migration[5.0]
  def change
  	 add_reference :travel_tipps, :travel_tipps_category, foreign_key: true
 
  end
end
