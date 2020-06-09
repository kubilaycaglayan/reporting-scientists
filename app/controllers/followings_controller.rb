class FollowingsController < ApplicationController
  def create
    user = User.find(params[:id])
    current_user.follow(user)
    flash[:notice] = "You successfully followed #{user.username}"
    redirect_to user
  end

  def destroy
    user = User.find(params[:id])
    current_user.unfollow(user)
    flash[:notice] = "You successfully unfollowed #{user.username}"
    redirect_to user
  end
end
