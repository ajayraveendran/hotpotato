class ChangePurchasePrice < ActiveRecord::Migration[5.2]
  def change
    rename_column :listings, :end_price, :purchase_price
  end
end
