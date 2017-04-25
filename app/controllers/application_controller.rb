class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper
  include MenuHelper

  protected
  def authenticate_user!
    unless logged_in?
      redirect_to login_path, flash: { danger: "Login please!" }
    end
  end
end
