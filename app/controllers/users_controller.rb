class UsersController < ApplicationController
  before_action :check_authorization, except: %i[new edit create]
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all.order(id: :desc).includes(:opinions, :profile_images, :followings, :followers)
  end

  def show
    @user = User.find(params[:id])
    @followers = @user.followers.includes(:profile_images)
    @comment = Comment.new
  end

  def new
    @user = User.new
    @user.cover_images.build
    @user.profile_images.build
    render layout: 'welcome' unless signed_in?
  end

  def edit
    @user = User.find(params[:id])
    @cover_image = @user.cover_images.build unless @user.cover_images.exists?
    @profile_image = @user.profile_images.build unless @user.profile_images.exists?
    render 'users/edit_form'
  end

  def create
    @user = User.new(user_params)

    photo_cover = Photo.new(user_id: @user.id, image_type: 'cover')
    photo_cover.image = URI.parse('https://ak.picdn.net/shutterstock/videos/12243746/thumb/1.jpg')

    photo_profile = Photo.new(user_id: @user.id, image_type: 'profile')
    photo_profile.image = URI.parse('https://cdn.iconscout.com/icon/free/png-512/avatar-372-456324.png')

    @user.cover_images << photo_cover
    @user.profile_images << photo_profile
    if @user.save
      sign_in @user
      redirect_to @user, notice: 'User was successfully created.'
    else
      flash[:notice] = 'That username is taken, try a different one...'
      redirect_to new_user_path
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Edit successful.'
      sign_in @user
      redirect_to user_path @user
    else
      flash[:notice] = "Edit wasn't successful."
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    if params[:id].to_i > User.last.id.to_i
      redirect_to root_path
      return
    end
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :coverimage,
                                 cover_images_attributes: %i[id image image_type],
                                 profile_images_attributes: %i[id image image_type])
  end
end
