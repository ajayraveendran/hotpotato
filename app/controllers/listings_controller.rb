class ListingsController < ApplicationController
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
end
