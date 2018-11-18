class CreateListingsWatchlists < ActiveRecord::Migration[5.2]
  def change
    create_table :listings_watchlists do |t|
      t.bigint :watchlist_id
      t.bigint :listing_id

      t.timestamps
    end
  end
end
