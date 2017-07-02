class UserMailer < ApplicationMailer
  default from: "stepandubovoy@gmail.com"

  def contact_form(email, name, phone, message)
  @message = message
    mail(from: email,
         to: 'stepandubovoy@gmail.com',
         subject: "A new contact form message from #{name}")
  end
end
