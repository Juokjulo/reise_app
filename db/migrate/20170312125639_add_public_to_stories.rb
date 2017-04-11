class AddPublicToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :public, :boolean
  end
end
