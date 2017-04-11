class AddDetailsToMaterials < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :public, :boolean, default: true
    add_column :materials, :sponsor_link, :string
    add_column :materials, :description, :text
    add_column :materials, :amazon_link, :string
  end
end
