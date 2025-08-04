module UsersHelper
  def referral_link(user)
    root_url(ref: user.referral_code)
  end
end