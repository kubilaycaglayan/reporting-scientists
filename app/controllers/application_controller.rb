class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def check_authorization
    current_user
    redirect_to new_session_path unless signed_in?
  end
end
