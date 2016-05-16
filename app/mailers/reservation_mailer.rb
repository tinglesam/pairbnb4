class ReservationMailer < ApplicationMailer
	default :from => "samjayting@gmail.com"

	def booking_confirmation(reservation)
		@reservation = reservation
  	@purchase = Purchase.find_by(reservation_id: reservation.id)
			@user = User.find(reservation.user_id)
    	mail(:to => @user.email, :subject => "Thanks for booking!")
  end

  def cart_confirmation(reservation)
  	@reservation = reservation
  	@user = User.find(reservation.user_id)
    byebug
  	mail(:to => @user.email, :subject => "You added something to the cart!")
  end

end
