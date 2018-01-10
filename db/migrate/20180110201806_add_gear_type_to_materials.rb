class AddGearTypeToMaterials < ActiveRecord::Migration[5.0]
  def change
  	add_column :material_categories, :gear_type, :integer, default: 0
  end
end
