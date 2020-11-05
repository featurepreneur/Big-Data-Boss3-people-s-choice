class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def create
    user = User.find_by(phone_number: params[:phone_number])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/players"
'''
        if user.phone_number== 7396083388
          redirect_to "/players/new"
        else
          redirect_to "/players"
        end
'''
    else
      flash[:error] = "Login-Attempt invalid,Please Try Again!!"
      redirect_to root_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user =nil
    redirect_to root_path
  end

end
