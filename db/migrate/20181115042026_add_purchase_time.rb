class AddPurchaseTime < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :purchase_time, :datetime
  end
end
