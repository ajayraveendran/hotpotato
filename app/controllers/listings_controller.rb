class ListingsController < ApplicationController
  include ActionController::Live

  def index
    @listings = Listing.all
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    listing = Listing.new
    listing.start_price = params[:start_price]
    listing.start_time = params[:start_time]
    listing.save
    redirect_to '/'
  end

  def update
    listing = Listing.find(params[:id])
    listing.title = params[:title]
    listing.image_url = params[:image_url]
    listing.end_price = params[:current_price]
    
    if listing.save
      redirect_to '/listings'
    else
      render :edit
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
  

  def price_response
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 3000, event: "ping")
    value_time = {
      50 => 120,
      100 => 300,
      500 => 600,
      1000 => 900,
      2500 => 1200,
      5000 => 1500,
      10000 => 1800
    }
    def time_grab obj, amt
      obj.each do |key, value|
        if amt <= key
          return value
          break
        end 
      end 
    end

    
    result = {}
    listings = Listing.all
    listings.each do |listing|
      if (listing.end_price == nil)
      total_seconds = time_grab(value_time, listing.start_price)
      interval = 3
      time_diff = (Time.now.utc - listing.start_time)
      no_of_decrements = total_seconds / interval
      dollar_decrements = listing.start_price / no_of_decrements
      new_price = (listing.start_price - ((time_diff * dollar_decrements) / interval)).round(1)
      result[listing.id] = new_price
      end
    end
    sse.write({ listings: result})
  ensure
    sse.close
  end

end
