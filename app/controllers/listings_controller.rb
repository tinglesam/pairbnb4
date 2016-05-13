class ListingsController < ApplicationController

	def index
		@listing = Listing.all 
	end

	def show 
		@listing = Listing.find(params[:id])
	end


	def new
		@listing = Listing.new
		render template: "listings/new"

	end

	def create
		@listing = current_user.listings.new(listing_params)
		
		@listing.dates = (params[:listing][:start_date]..params[:listing][:end_date]).map(&:to_s)
		if @listing.save
	      flash[:success] = "Thank you for your listing"
	      redirect_to @listing
	    else
	      render template: "listings/new"
	    end
	end

	def edit
    	@listing = Listing.find(params[:id])

  	end

  def update
  	byebug
    @listing = Listing.find(params[:id])

    if @listing.update_attributes(listing_params)
    byebug
      redirect_to @listing

    else
      render 'edit'
    end
  end

  def destroy
    Listing.find(params[:id]).destroy
    flash[:success] = "Listing deleted"
    redirect_to listings_url
  end


	private

	def listing_params
		params.require(:listing).permit(:user_id, :name, :price, :address, :people, :amenities, :start_date, :end_date, {images:[]})
	end



end
