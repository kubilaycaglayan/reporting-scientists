module SessionsHelper
  def signed_in?
    !session[:current_user_id].nil?
  end

  def current_user_id
    signed_in? ? session[:current_user_id] : nil
  end

  def current_user
    signed_in? ? User.find(session[:current_user_id]) : nil
  end

  def sign_in(user)
    session[:current_user_id] = user.id
  end
end
