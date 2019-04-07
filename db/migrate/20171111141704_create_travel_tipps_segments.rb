class CreateTravelTippsSegments < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_tipps_segments do |t|
      t.string :titleLeft
      t.text :contentLeft
      t.boolean :borderLeft, default: false
      t.string :colorLeft
      t.string :titleRight
      t.text :contentRight
      t.boolean :borderRight, default: false
      t.string :colorRight
      t.boolean :fullsize, default: false
      t.belongs_to :travel_tipp, index: true
      t.belongs_to :picture, index: true

      t.timestamps
    end
  end
end
