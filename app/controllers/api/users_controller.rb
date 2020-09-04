class API::UsersController < ApplicationController
  def index
    @users = Users.all
    respond_to do |format|
      format.json { render :json => @users }
    end
  end
end
