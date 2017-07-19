class ConfirmationsController < Devise::ConfirmationsController
  
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)

    if successfully_sent?(resource)
      flash[:notice] = "Account already confirmed! Please try logging in." if resource.confirmed?
      respond_with({}, :location => after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  private
  def after_confirmation_path_for(resource_name, resource)
    products_path
  end
end