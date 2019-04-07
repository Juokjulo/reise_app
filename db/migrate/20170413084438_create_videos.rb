class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.boolean :public
      t.string :name
      t.text :description
      t.string :url
      t.belongs_to :country, index: true

      t.timestamps
    end
  end
end
