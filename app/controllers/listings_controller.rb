# encoding: utf-8
class ListingsController < ApplicationController
  include ActionController::Live
  include SessionsHelper

  def index
    @listings = Listing.all
  end

  def filter
    if (params[:category] == 'all')
      @listings = Listing.all
      render :index
    else
      @listings = Listing.where(category: params[:category])
      render :index
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def show
    @listing = Listing.find(params[:id])
    @seller = User.find(@listing.seller_id)
  end

  def create
    listing = Listing.new
    listing.seller_id = current_user.id
    listing.start_price = params[:start_price]
    listing.image_url = params[:image_url]
    listing.start_time = params[:start_time].in_time_zone("Melbourne")
    total_seconds = time_grab(listing.start_price)
    listing.end_time = listing.start_time + total_seconds
    listing.category = params[:category]
    listing.title = params[:title]
    if listing.save
      redirect_to '/'
    else
      render :new
    end
  end

  def update
    listing = Listing.find(params[:id])
    listing.purchase_price = params[:current_price]
    listing.purchase_time = Time.now.in_time_zone("Melbourne")
    listing.status = 'purchased'
    listing.buyer_id = current_user.id
    if listing.save
      redirect_to "/listings/#{listing.id}/connect"
    else
      redirect_to "/listings/#{listing.id}"
    end
  end

  def destroy
    listing = Listing.find(params[:id])
    if listing.destroy
      redirect_to '/listings'
    else
      render :index
    end
  end
  
  def connect
    @listing = Listing.find(params[:id])
    @seller = User.find(@listing.seller_id)
  end

  def show_watchlist
    @user = User.find(current_user.id)
    @watchlist = []

    @user.watchlist.each do |listing_id|
      listing = Listing.find(listing_id)
      @watchlist << listing
    end
    render :watchlist
  end

  def toggle_watchlist
    @listings = Listing.all
    user = User.find(current_user.id)
    listing= Listing.find(params[:id])    
    if user.watchlist.include?(listing.id)
      user.watchlist.delete(listing.id)
      user.save
      render :index
    else
      user.watchlist << listing.id
      user.save
      render :index
    end
  end

  def price_response
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 1000, event: "ping")
    
    result = {}
    listings = Listing.all
    listings.each do |listing|  
    total_seconds = time_grab(listing.start_price)
    interval = 3
     
      if listing.status == 'purchased'
        result_string = "Sold for $#{listing.purchase_price}"
      elsif Time.now.utc.to_i < listing.start_time.to_i && Time.now.utc.to_i < listing.end_time.to_i     
        result_string = "Auction starts in: #{formatted_time(listing.start_time.to_i - Time.now.utc.to_i)}"
      elsif Time.now.utc.to_i > listing.end_time.to_i
        result_string = "Auction has expired"
      else
        time_diff = Time.now.utc - listing.start_time
        no_of_decrements = total_seconds / interval
        dollar_decrements = listing.start_price / no_of_decrements
        result_string = "#{(listing.start_price - ((time_diff * dollar_decrements) / interval)).round(0)}"
      end

    result[listing.id] = [result_string, listing.status, listing.buyer_id, listing.seller_id, listing.purchase_price]
    end
      sse.write({result: result})
    ensure
      sse.close
  end


  
  private
  def time_grab amt
    value_time = {
      50 => 120,
      100 => 300,
      500 => 600,
      1000 => 900,
      2500 => 1200,
      5000 => 1500,
      10000 => 1800
    }
    value_time.each do |key, value|
      if amt <= key
        return value
        break
      end 
    end 
  end

  def formatted_time total_seconds
    mm, ss = total_seconds.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    "#{dd} days, #{hh} hours, #{mm} min, #{ss} sec"
  end

end