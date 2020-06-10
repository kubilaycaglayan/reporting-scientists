class FollowingsController < ApplicationController
  before_action :check_authorization

  def create
    user = User.find(params[:id])
    current_user.follow(user)
    flash[:notice] = "You've successfully followed #{user.username}"
    redirect_to user
  end

  def destroy
    user = User.find(params[:id])
    current_user.unfollow(user)
    flash[:notice] = "You've successfully unfollowed #{user.username}"
    redirect_to user
  end
end
