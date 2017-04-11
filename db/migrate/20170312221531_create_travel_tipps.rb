class CreateTravelTipps < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_tipps do |t|
      t.string :name
      t.text :description
      t.belongs_to :country, index: true
      
      t.timestamps
    end
  end
end
