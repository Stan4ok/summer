# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("stepandubovoy@gmail.com", "Stephen", "Hey there!", "012345678")
  end
  def signup_email
    UserMailer.signup_email(User.second)
  end
end

