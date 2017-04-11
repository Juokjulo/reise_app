class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :name
      t.text :description
      t.string :image
      t.belongs_to :country, index: true

      t.timestamps
    end
  end
end
