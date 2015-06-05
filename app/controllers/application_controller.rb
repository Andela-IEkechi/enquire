class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_action :store_location
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token

  # Define route on sign in
  def after_sign_in_path_for(resource)
    if @user.sign_in_count < 2
      edit_user_registration_path(@user)
    else
      session[:previous_url] || questions_path
    end
  end

  # Define route on sign up
  def after_sign_up_path_for(resource)
    edit_user_registration_path(@user)
  end

  protected

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def store_location
    session[:previous_url] = request.fullpath unless in_users_path? || in_doctors_path?
  end

  def in_users_path?
    request.fullpath =~ /\/users/
  end

  def in_doctors_path?
    request.fullpath =~ /\/doctors/
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :name, :image) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :bio, :image) }
  end

end
