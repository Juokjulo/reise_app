class AddPublicToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :public, :boolean
    add_column :countries, :public, :boolean
    add_column :travel_tipps, :public, :boolean
  end
end
