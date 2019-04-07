class AddSentToNewsletters < ActiveRecord::Migration[5.0]
  def change
  	add_column :newsletters, :sent, :boolean, default: false
  end
end
