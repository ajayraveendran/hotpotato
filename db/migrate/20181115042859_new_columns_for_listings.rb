class NewColumnsForListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :category, :string
    add_column :listings, :status, :string
  end
end
