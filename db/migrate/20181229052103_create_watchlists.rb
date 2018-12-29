class CreateWatchlists < ActiveRecord::Migration[5.2]
  def change
    create_table :watchlists do |t|
      t.integer :buyer_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
