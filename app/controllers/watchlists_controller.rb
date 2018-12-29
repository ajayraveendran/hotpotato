class WatchlistsController < ApplicationController

  def index
    @watchlist_items = Watchlist.where(watcher_id: session[:user_id])
    raise 'error'
  end

end
