module CommentsHelper
  def show_comments(tweet)
    return if tweet.comments.empty?

    render 'comments/comments', comments: tweet.comments.order(id: :desc)
  end
end
