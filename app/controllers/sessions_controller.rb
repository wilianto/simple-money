class SessionsController < ApplicationController
  layout "blank"

  def new
  end

  def create
    user = User.find_by_email params[:session][:email].downcase

    if user && user.authenticate(params[:session][:password])
      login! user
      flash[:success] = "Login success!"
      redirect_to dashboard_path
    else
      flash.now[:danger] = "Login failed!"
      render "new"
    end
  end

  def destroy
    logout!
    redirect_to login_path, flash: { success: "Logout success!" }
  end
end
