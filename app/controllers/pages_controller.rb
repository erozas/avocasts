class PagesController < ApplicationController
  allow_unauthenticated_access only: %i[ home ]
  before_action :resume_session

  def home
  end

  def refer_a_friend
  end
end