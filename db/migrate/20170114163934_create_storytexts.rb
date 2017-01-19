class CreateStorytexts < ActiveRecord::Migration[5.0]
  def change
    create_table :storytexts do |t|
      t.string :title
      t.text :storypart
      t.belongs_to :story, index: true

      t.timestamps
    end
  end
end
