class CreateReferralCodesForExistingUsers < ActiveRecord::Migration[8.0]
  def up
    User.find_each do |user|
      user.referral_codes.create unless user.referral_codes.any?
    end
  end

  def down
    User.find_each do |user|
      user.referral_codes.destroy_all
    end
  end
end
