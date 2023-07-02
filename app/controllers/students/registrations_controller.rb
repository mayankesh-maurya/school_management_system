# frozen_string_literal: true

class Students::RegistrationsController < Devise::RegistrationsController

  before_action :sign_up_params

  # POST /resource
  def create
    super
  end

  protected
  # If you have extra params to permit, append them to the sanitizer.
  def sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :school_id, :course_id, :batch_id])
  end

  # In Devise's code, #create will call a protected method #sign_up after saving successfully. This method does nothing but sign in the user. What we need to do is to overwrite this method to stop that action. Of course you can even add more of your logic here if necessary.
  def sign_up(resource_name, resource)
    true
  end


end
