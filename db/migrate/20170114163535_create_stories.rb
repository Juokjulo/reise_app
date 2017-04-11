class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :short_description
      t.belongs_to :country, index: true
      t.belongs_to :user, index: true
      t.belongs_to :picture, index: true

      t.timestamps
    end
  end
end
