class SessionsController < ApplicationController

  def new
  end

  def create

    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Welcome to the Jungle'
    else
      redirect_to login_path, notice: 'Login #fail. Try Again'
    end
  end

  def destroy
    empty_cart!
    session[:user_id] = nil
    redirect_to login_path, notice: 'Farewell, friend.'
  end

end
