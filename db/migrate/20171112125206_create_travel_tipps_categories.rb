class CreateTravelTippsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_tipps_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
