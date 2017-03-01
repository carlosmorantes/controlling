class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    main_index_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # your_path
  end

  private

  def user_not_authorized
    flash[:alert] = 'Access Denied'
    redirect_to(request.referer || root_path)
  end

  protected

  # check the method superadmin in application_policy.rb
  def superadmin_authenticate
    authorize current_user, :superadmin?
  end

  def configure_permitted_parameters
    registration_params = [:first_name, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(registration_params) }
  end


end
