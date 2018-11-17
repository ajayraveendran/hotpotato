class WatchlistsController < ApplicationController
  def create
    # byebug
    lw = ListingsWatchlist.new
    lw.watchlist_id = current_user.watchlist.id
    lw.listing_id = params[:listing_id]
    lw.save
  end
end