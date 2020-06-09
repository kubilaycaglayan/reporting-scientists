module UsersHelper
  def follow_button(user)
    if following?(user)
      render 'users/already_following'
    else
      render 'users/follow_button'
    end
  end
end
