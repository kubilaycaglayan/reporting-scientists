class OpinionsController < ApplicationController
  before_action :set_opinion, only: %i[show edit update destroy]
  before_action :check_authorization

  def index
    @tweets = current_user.visible_opinions.includes(:user)
    @opinion = current_user.opinions.build
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

  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: 'Opinion was successfully updated.' }
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.html { render :edit }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to opinions_url, notice: 'Opinion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_opinion
    @opinion = Opinion.find(params[:id])
  end

  def opinion_params
    params.require(:opinion).permit(:author_id, :text)
  end
end
