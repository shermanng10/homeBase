class SessionsController < ApplicationController
  def create
    p params[:email]
    user = Family.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to :back
    else
      flash.now[:danger] = "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :back
  end
end
