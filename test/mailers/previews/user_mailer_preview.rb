# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("stepandubovoy@gmail.com", "Stephen", "012345678", "Hey there!")
  end
end

