class CreateStorytextPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :storytext_pictures do |t|
      t.string :options
      t.integer :size
      t.belongs_to :storytext, index: true
      t.belongs_to :picture, index: true

      t.timestamps
    end
  end
end
