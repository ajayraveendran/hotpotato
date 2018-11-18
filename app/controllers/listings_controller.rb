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
    @listing = Listing.new
    listing = Listing.new
    listing.start_price = params[:start_price]
    listing.start_time = params[:start_time].in_time_zone("Melbourne")
    total_seconds = time_grab(listing.start_price)
    listing.end_time = listing.start_time + total_seconds
    if listing.save
      redirect_to '/'
    else
      render :new
    end
  end

  def update
    listing = Listing.find(params[:id])
    listing.title = params[:title]
    listing.image_url = params[:image_url]
    listing.purchase_price = params[:current_price]
    
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
    
    result = {}
    listings = Listing.all
    listings.each do |listing|
      
      if listing.purchase_price == nil
      total_seconds = time_grab(listing.start_price)
      interval = 3
      
      if Time.now.utc.to_i < listing.start_time.to_i && Time.now.utc.to_i < listing.end_time.to_i
        return_value = "Auction starts in #{formatted_time(listing.start_time.to_i - Time.now.utc.to_i)}"
      elsif Time.now.utc.to_i > listing.end_time.to_i
        return_value = "Auction has expired"
      else 
        # return decrementing current price
        time_diff = Time.now.utc - listing.start_time
        no_of_decrements = total_seconds / interval
        dollar_decrements = listing.start_price / no_of_decrements
        return_value = "Current price is $#{(listing.start_price - ((time_diff * dollar_decrements) / interval)).round(0)}"

      end
      result[listing.id] = return_value
      end
    end
    sse.write({result: result})
  ensure
    sse.close
  end

  def update_price
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
    "#{dd} days, #{hh} hours, #{mm} minutes and #{ss} seconds"
  end

end