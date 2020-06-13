class OpinionsController < ApplicationController
  before_action :check_authorization

  def index
    @tweets = current_user.visible_opinions.includes(:user, :comments)
    @opinion = current_user.opinions.build
    @comment = current_user.comments.build
  end

  def new
    @opinion = current_user.opinion.build
  end

  def create
    @opinion = current_user.opinions.new(opinion_params)

    flash[:notice] = if @opinion.save
                       'Report created successfully.'
                     else
                       'Report should be less than 140 characters.'
                     end
    redirect_to opinions_path
  end

  private

  def opinion_params
    params.require(:opinion).permit(:author_id, :text)
  end
end
