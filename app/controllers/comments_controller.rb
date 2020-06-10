class CommentsController < ApplicationController
  before_action :check_authorization

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    flash[:notice] = if @comment.save
                       'Comment created.'
                     else
                       'Comment should be less than 140 characters.'
                     end
    redirect_to opinions_path
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :opinion_id, :content)
  end
end
