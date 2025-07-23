class User < ApplicationRecord
  include Refer::Model
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  after_create :create_referral_code

  def referral_code
    referral_codes.last.try(:code)
  end

  private

  def create_referral_code
    referral_codes.create
  end
end
