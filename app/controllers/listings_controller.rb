class ListingsController < ApplicationController
  include ActionController::Live

  def index
    @listings = Listing.all  
  end

  def price_response
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 300, event: "ping")
    sse.write({ name: 'John'}, id: 5)
  ensure
    sse.close
  end
end
