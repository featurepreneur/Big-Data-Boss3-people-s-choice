class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    ensure_admin_logged_in
  end

  def create
    phone_number = session[:phone_number]
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      phone_number: phone_number,
      voted: false

    )
    user_check = User.find_by(phone_number: session[:phone_number])

    if user_check
      flash[:error] = "Mobile already registered"
      session[:country_code] = nil
      session[:phone_number] = nil

      redirect_to root_path

    else
      if user.save
        flash[:error] = "Regestered successfully"
        session[:country_code] = nil
        session[:phone_number] = nil
        redirect_to players_path
      else
        flash["error"] = user.errors.full_messages.join(", ")
        session[:country_code] = nil
        session[:phone_number] = nil

        redirect_to new_home_path
      end
    end

  end

end
