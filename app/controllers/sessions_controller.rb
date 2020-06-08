class SessionsController < ApplicationController
  def new
    if signed_in?
      redirect_to opinions_path
    else
      @user = User.new
    end
  end

  def create
    puts "CREATE IN SESSIONS"
    @user = User.find_by(username: params[:user][:username])
    p @user
    if @user
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
