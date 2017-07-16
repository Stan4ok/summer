class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @product = Product.find(params[:product_id])
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_registration_path
    end
    
    token = params[:stripeToken]
# Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: @product.price * 100, # amount in cents, again
        currency: "eur",
        source: token,
        description: @product.name,
        receipt_email: params[:stripeEmail]
      )

      if charge.paid
        Order.create(
          user_id: @user_id,
          product_id: params[:product_id],
          total: @product.price * 100)
        flash[:notice] = "Congratulation on your purchase! You will receive an email confirmation."
        UserMailer.purchase_confirmation(@user, @product).deliver_now
      end
      # The card has been declined
      rescue Stripe::CardError => e
        body = e.json_body
        err = body[:error]
        flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      end
      redirect_to product_path(@product)
  end
end
