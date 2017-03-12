class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :sponsor
      t.belongs_to :material_category, index: true

      t.timestamps
    end
  end
end
