class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_current_user

  # signed_in ヘルパーメソッドを追加
  helper_method :signed_in?

  private
  def signed_in?
  	true if session[:oauth_token]
  end
  
  def set_current_user
  	@current_user ||= User.find session[:user_id] if session[:user_id]
  end
end
