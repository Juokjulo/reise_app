class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.text :shortDescription
      t.belongs_to :picture, index: true

      t.timestamps
    end
  end
end
