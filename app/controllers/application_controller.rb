class ApplicationController < ActionController::Base
  include Authentication
  helper_method :user_signed_in?, :current_user

  private
  
  def user_signed_in?
    true
  end

  def current_user
  end
end
