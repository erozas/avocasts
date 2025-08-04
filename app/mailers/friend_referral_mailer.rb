class FriendReferralMailer < ApplicationMailer
  def referral_email(user, friend)
    @user = user
    @friend = friend
    mail(to: @friend.email, subject: "Hey, #{@user.name} wants you to know about AvoCasts")
  end
end