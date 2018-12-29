class DropListingsWatchlists < ActiveRecord::Migration[5.2]
  def change
    drop_table :listings_watchlists
  end
end
