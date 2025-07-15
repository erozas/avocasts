module ApplicationHelper
  def referral_link(user)
    "http://localhost:3000/?code=#{user.referral_code}"
  end
end
