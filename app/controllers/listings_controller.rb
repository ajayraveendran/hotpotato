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
    listing.start_time = Time.new #params[start_time]
    listing.save
    redirect_to '/'
  end

  def update
    listing = Listing.find(params[:id])
    listing.name = params[:name]
    listing.image_url = params[:image_url]
    if listing.save
      redirect_to '/listings'
    else
      render :edit
    end
  end

  def price_response
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 1000, event: "ping")

    result = {}
    listings = Listing.all
    listings.each do |listing|
      time_diff = (Time.now.to_i - listing.start_time.to_i)
      new_price = listing.start_price * time_diff
      result[listing.id] = new_price
    end
    
    sse.write({ listings: result})
  ensure
    sse.close
  end

  def update_price
  end
end
