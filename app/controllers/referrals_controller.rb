class ReferralsController < ApplicationController
  before_action :resume_session, only: [:index]

  def index
    @referrals = current_user.referrals.order(created_at: :desc).map(&:referee)
    @referral_visits = Refer::Visit.where(referral_code: current_user.referral_code_id)
    @referred_subscribers = 1
  end
end