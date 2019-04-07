class AddNewsletterAboToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :newsletter_abo, :boolean, default: false
  end
end
