class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def check_authorization
    redirect_to new_session_path unless signed_in?
  end
end
