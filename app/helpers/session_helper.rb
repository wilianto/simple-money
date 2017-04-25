module SessionHelper
  def logged_in?
    current_user.present?
  end

  def current_user
    user_id = session[:user_id]
    User.find_by(id: user_id)
  end

  def login!(user)
    session[:user_id] = user.id
  end

  def logout!
    session[:user_id] = nil
  end
end
