class WatchlistsController < ApplicationController
  def create
    lw = ListingsWatchlist.new
    lw.watchlist_id = current_user.watchlist.id
    lw.listing_id = params[:listing_id]
    lw.save
  end

  def get_watchlist_count
    if current_user.watchlist
      render json: {result: current_user.watchlist.listing_ids.count}
    else
      render json: {result: 0}
    end
  end
end