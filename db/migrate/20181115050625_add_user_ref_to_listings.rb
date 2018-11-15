class AddUserRefToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :buyer_id, :integer
    add_column :listings, :seller_id, :integer

    add_foreign_key :listings, :users, column: :buyer_id
    add_foreign_key :listings, :users, column: :seller_id
  end
end
