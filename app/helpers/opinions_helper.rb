module OpinionsHelper
  def last_tweet(user)
    if user.opinions.last
      user.opinions.last.text
    else
      "This scientist hasn't reported yet"
    end
  end
end
