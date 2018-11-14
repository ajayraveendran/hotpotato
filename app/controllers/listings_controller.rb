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

  def destroy
    listing = Listing.find(params[:id])
    if listing.destroy
      redirect_to '/listings'
    else
      render :index
    end
  end
  

end
