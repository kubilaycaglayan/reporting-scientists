class FollowingsController < ApplicationController
  before_action :check_authorization

  def create
    user = User.find(params[:id])
    flash[:notice] = if current_user.follow(user)
                       "You've successfully followed #{user.username}"
                     else
                       'There was a problem with following.'
                     end
    redirect_to user
  end

  def destroy
    user = User.find(params[:id])
    flash[:notice] = if current_user.unfollow(user)
                       "You've successfully unfollowed #{user.username}"
                     else
                       'There was a problem with unfollowing.'
                     end
    redirect_to user
  end
end
