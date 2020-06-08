class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    session[:current_user] = @user
    redirect_to root_path
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path
  end
end
