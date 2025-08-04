class ApplicationController < ActionController::Base
  include Authentication
  set_referral_cookie
  before_action :resume_session
  helper_method :user_signed_in?, :current_user

  private
  
  def user_signed_in?
    Current.user.present?
  end

  def current_user
    Current.user
  end
end
