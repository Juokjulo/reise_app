class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
 	  t.string :title   
      t.text :content
      t.string :email
      t.belongs_to :commentable, polymorphic: true, index: true
	  t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
