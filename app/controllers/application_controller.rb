class ApplicationController < ActionController::Base

  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    unless current_user
      redirect_to root_path
    end
  end
  def ensure_admin_logged_in
    unless current_user.phone_number == 7396083388
      redirect_to players_path
    end
  end

  def current_user
    return @current_user if @current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end

end