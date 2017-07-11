 class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      UserMailer.signup_email(@user).deliver_now
    end
  end
end


#    if @user.save  
 #     UserMailer.signup_email(@user).deliver_now
  #  else
