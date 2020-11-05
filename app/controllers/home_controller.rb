class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    render "index"
  end
  def new
      render :new

  end

  def create
    session[:phone_number] = params[:phone_number]
    session[:country_code] = params[:country_code]
    @response = Authy::PhoneVerification.start(
      via: params[:method],
      country_code: params[:country_code],
      phone_number: params[:phone_number]
    )
    if @response.ok?
      redirect_to "/home/challenge"
    else
      redirect_to root_path
    end
  end

  def challenge

  end

  def verify
    @response = Authy::PhoneVerification.check(
      verification_code: params[:code],
      country_code: session[:country_code],
      phone_number: session[:phone_number]
    )
    @response2 = @response
    if @response.ok?

      flash[:error] = "Mobile Verified"
      redirect_to "/home/new"
    else
      render :challenge
    end

  end

  def success
  end
end
