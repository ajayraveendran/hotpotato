class PurchasePrice < ActiveRecord::Migration[5.2]
  def change
    change_column :listings, :image_url, :string
  end
end
