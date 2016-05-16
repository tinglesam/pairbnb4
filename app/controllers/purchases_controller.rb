class PurchasesController < ApplicationController
  #before_action :authenticate_user!
 # before_action :check_cart!
   
  # Other Code
  def new
    @client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find(params[:rez_id])
    @purchase = Purchase.new
  	#gon.client_token = generate_client_token
  end
  

 def create
  @reservation = Reservation.find(params[:purchase][:reservation_id])
  nonce = params[:payment_method_nonce]
  render action: :new and return unless nonce
  result = Braintree::Transaction.sale(
    amount: params[:purchase][:price].to_s,
    payment_method_nonce: params[:payment_method_nonce]
  )

  # reserve to save the transaction details into database
  @reservation.paid = true
  @reservation.save
  @user = User.find(@reservation.user_id)

  @purchase = Purchase.find_by(reservation_id: @reservation.id)
  @purchase.price = params[:purchase][:price]
  @purchase.save

  ReservationMailer.booking_confirmation(@reservation).deliver




  redirect_to reservations_path

 end

  # private
  # def check_cart!
  #   if !current_user.reservations
  #     redirect_to root_url, alert: "Please add some items to your cart before processing your transaction!"
  #   end
  # end


end