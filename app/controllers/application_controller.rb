class ApplicationController < ActionController::Base
  set_referral_cookie
  include Authentication
  helper_method :user_signed_in?, :current_user

  private
  
  def user_signed_in?
    Current.user.present?
  end

  def current_user
    Current.user
  end
end
