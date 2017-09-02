class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :title
      t.text :maplink
      t.text :description
      t.string :garminlink

      t.timestamps
    end
  end
end
