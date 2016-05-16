class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(reservation)
   	
  	ReservationMailer.cart_confirmation(reservation).deliver_now



  end
end
