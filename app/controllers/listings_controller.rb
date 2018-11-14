class ListingsController < ApplicationController
  include ActionController::Live

  def index
    @listings = Listing.all
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
