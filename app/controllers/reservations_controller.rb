class ReservationsController < ApplicationController



  def index
	@reservation = Reservation.all 
  end

  def show 
	@reservation = Reservation.find(params[:id])
  end

  def new
  	@reservation = Reservation.new
 
  	@listing = Listing.find(params[:listing])

  end

  def create
  	date = params[:datefilter]

    split_date = date.split(' - ')
               
    check_in_date = split_date[0]
    check_out_date = split_date[1]
    byebug
   	check_in =Date.strptime(check_in_date, "%m/%d/%Y")
    check_out = Date.strptime(check_out_date, "%m/%d/%Y")


	@reservation = current_user.reservations.new(reservation_params)
	@reservation.checkin= check_in
	@reservation.checkout = check_out
	if @reservation.save
      flash[:success] = "Thank you for your reservation"
      redirect_to @reservation
    else
      render template: "reservation/new"
    end
  end

  def update

  end


  private

	def reservation_params

		params.require(:reservation).permit(:user_id, :people, :listing_id, :checkin, :checkout)
	end

end
