class FollowingsController < ApplicationController
  def new; end

  def create
    user = User.find(params[:id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = User.find(params[:id])
    current_user.unfollow(user)
    redirect_to user
  end
end
