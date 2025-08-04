class User < ApplicationRecord
  REFERRAL_WINDOW = 30.days.freeze
  MAX_ALLOWED_REFERRALS = 5.freeze

  include Refer::Model
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  after_create :create_referral_code

  def referral_code
    referral_codes.last.try(:code)
  end

  def referral_code_id
    referral_codes.last.try(:id)
  end

  def qualifies_for_referral?
    created_at >= REFERRAL_WINDOW.ago && referrer.referrals.count < MAX_ALLOWED_REFERRALS
  end

  def subscription_status
    ["Active", "Trial"].sample
  end

  def subscription_plan
    ["Pro", "None"].sample
  end

  private

  def create_referral_code
    referral_codes.create
  end
end
