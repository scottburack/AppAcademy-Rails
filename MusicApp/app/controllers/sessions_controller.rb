class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
    params[:user][:email],
    params[:user][:password]
    )

    if @user
      login(@user)
      redirect_to bands_url
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end




end
