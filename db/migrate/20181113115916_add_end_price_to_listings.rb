class AddEndPriceToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :end_price, :decimal
  end
end
