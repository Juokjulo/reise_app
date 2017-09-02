class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :text
      t.string :text_link
      t.string :link
      t.string :color

      t.timestamps
    end
  end
end
