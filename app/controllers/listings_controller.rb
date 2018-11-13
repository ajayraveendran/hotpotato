class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def edit
    @listings = Listing.find(params[:id])
  end

  def show
    @listings = Listing.find(params[:id])
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
