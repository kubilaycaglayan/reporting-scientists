module SessionsHelper
  def signed_in?
    !session[:current_user_id].nil?
  end

  def current_user_id
    signed_in? ? session[:current_user_id] : nil
  end

  def current_user
    signed_in? ? User.find(session[:current_user_id]) : nil
  rescue StandardError
    sign_out
    flash[:notice] = 'This user has been removed.'
  end

  def sign_in(user)
    session[:current_user_id] = user.id
  end

  def sign_in_page_link
    return if signed_in?

    link_to 'Back to Sign In Page', new_session_path, class: 'btn btn-primary text-white'
  end

  def sign_out
    session[:current_user_id] = nil
    true
  end
end
