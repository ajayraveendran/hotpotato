module UsersHelper
  def watchlist_count
    if current_user.watchlist
      current_user.watchlist.listing_ids.count
    else
      0
    end
  end
end
