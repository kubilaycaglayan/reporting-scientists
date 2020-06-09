class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @followers = @user.followers.includes(:profile_images)
  end

  # GET /users/new
  def new
    @user = User.new
    @user.cover_images.build
    @user.profile_images.build
    render layout: 'welcome' unless signed_in?
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @cover_image = @user.cover_images.build unless @user.cover_images.exists?
    @profile_image = @user.profile_images.build unless @user.profile_images.exists?
    render 'users/edit_form'
  end

  # POST /users
  # POST /users.json
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

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :coverimage,
                                 cover_images_attributes: %i[id image image_type],
                                 profile_images_attributes: %i[id image image_type])
  end
end
