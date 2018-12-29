class AddUserRefToWatchlists < ActiveRecord::Migration[5.2]
  def change
    rename_column :watchlists, :buyer_id, :watcher_id
    add_foreign_key :watchlists, :users, column: :watcher_id
  end
end
