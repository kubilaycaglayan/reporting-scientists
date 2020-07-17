module UsersHelper
  def follow_button(user)
    return if current_user == user

    if current_user.following?(user)
      render 'users/already_following', user: user
    else
      render 'users/follow_button', user: user
    end
  end

  def edit_button(user)
    render 'users/edit_button', user: user if current_user == user
  end

  def followed_by_notice(user)
    if current_user.followed_by(user)
      render 'users/followed_by', user: current_user.followed_by(user)
    else
      'You can follow this user.'
    end
  end

  def last_three_user
    User.all[0,12]
  end

  def show_avatar(user)
    render 'users/show_avatar', user: user
  end
end
