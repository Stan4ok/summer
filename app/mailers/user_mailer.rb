class UserMailer < ApplicationMailer
  default from: "stepandubovoy@gmail.com"

  def contact_form(email, name, message, phone)
  @message = message
  @phone = phone
    mail(from: email,
          to: 'stepandubovoy@gmail.com',
          subject: "A new contact form message from #{name}"
 # Don't need the body param as we use a template for the body.
 #         body: "#{name} wrote to you: #{@message}",
 #         body: "Contact Telephone: #{phone}"
    )
  end
    def signup_email(user)
  @user = user
    mail(to: @user.email,
          subject: "Welcome to Bike Berlin!"
    )
  end
end
