class ReferralEmailsController < ApplicationController
  def create
    emails = params[:emails].split(",")
    emails.each do |email|
      FriendReferralMailer.referral_email(current_user, email).deliver_later
    end
  end
end