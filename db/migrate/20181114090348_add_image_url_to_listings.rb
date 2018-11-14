class AddImageUrlToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :image_url, :string
    add_column :listings, :title, :string
  end
end
