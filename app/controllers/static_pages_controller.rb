class StaticPagesController < ApplicationController
  def index
  	@products = Product.limit(5)
  end

  def landing_page
  	@featured_product = Product.first
  end
  
#  def thank_you
#    @name = params[:name]
#    @email = params[:email]
#    @phone = params[:phone] 
#    @message = params[:message]
#    ActionMailer::Base.mail(from: @email,
#      to: 'stepandubovoy@gmail.com',
#      subject: "A new contact form message from #{@name}",
#      body: "#{@name} wrote to you: #{@message}",
#      body: "Contact Telephone: #{@phone}").deliver_now
#  end
 def thank_you
   @name = params[:name]
   @email = params[:email]
   @phone = params[:phone] 
   @message = params[:message] 
   UserMailer.contact_form(@email, @name, @phone, @message).deliver_now
 end

end
