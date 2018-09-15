class SessionsController < ApplicationController
  def new
    render :new
  end
  
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if user
      log_in_user!(user)
      redirect_to user_url(user.id)
    else
      flash.now[:errors] = ['User not found']
      render :new
    end
  end
  
  def destroy
    log_out_user!
    redirect_to new_session_url
  end
end