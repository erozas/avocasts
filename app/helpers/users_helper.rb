module UsersHelper
  def referral_link(user)
    root_url(code: user.referral_code)
  end
end