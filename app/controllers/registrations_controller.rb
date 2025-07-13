class RegistrationsController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  before_action :redirect_if_logged_in, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to root_path, notice: "Welcome to AvoCasts! Please complete the onboarding process to get started."
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def redirect_if_logged_in
    if current_user.present?
      flash[:notice] = "You are already logged in."
      redirect_back(fallback_location: root_path)
    end
  end

  def user_params
    params.expect(user: [:email_address, :password, :password_confirmation])
  end

end