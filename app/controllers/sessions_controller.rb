class SessionsController < ApplicationController
  def create
    user = Family.find_by(email: params[:email])
    if user && user.authentication(params[:password])
      log_in user
    else
      flash.now[:danger] = "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
  end
end
