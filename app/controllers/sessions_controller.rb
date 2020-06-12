class SessionsController < ApplicationController
  layout 'welcome'

  def new
    if signed_in?
      redirect_to opinions_path
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user
      flash[:notice] = 'Login successful.'
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      @user = User.new(username: params[:user][:username])
      flash[:notice] = 'User not exist.'
      render :new
    end
  end

  def destroy
    flash[:notice] = if sign_out
                       'Logout successful.'
                     else
                       'Logout was not successful.'
                     end
    redirect_to root_path
  end
end
