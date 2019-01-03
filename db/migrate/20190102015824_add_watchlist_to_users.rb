class AddWatchlistToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :watchlist, :integer, array: true, default: []    
  end
end
