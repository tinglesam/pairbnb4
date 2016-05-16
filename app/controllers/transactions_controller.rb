class TransactionsController < ApplicationController
  #before_action :authenticate_user!
  before_action :check_cart!
   
  # Other Code
  def new
    @client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find(params[:rez_id])
    @transaction = Transaction.new
  	#gon.client_token = generate_client_token
  end
  

 def create
  nonce = params[:payment_method_nonce]
  render action: :new and return unless nonce
  result = Braintree::Transaction.sale(
    amount: "10.00",
    payment_method_nonce: params[:payment_method_nonce]
  )

  # reserve to save the transaction details into database

  redirect_to reservations_path

end

  private
  def check_cart!
    if !current_user.reservations
      redirect_to root_url, alert: "Please add some items to your cart before processing your transaction!"
    end
  end


end
