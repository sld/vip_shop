class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  before_filter :authenticate_user!


  protected


  def build_user_cart
    current_user.cart || current_user.create_cart 
  end
  
end
