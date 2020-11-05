class PlayersController < ApplicationController
  before_action :ensure_user_logged_in

  def new
    ensure_admin_logged_in
  end
  def index
    render "index"
  end

  def create
    player = Player.new(
      name: params[:name],
      phone_number: params[:phone_number],
      votes: 0

    )
    if player.save
      flash[:error] = "Regestered successfully"
      redirect_to "/players/new"
    else
      flash["error"] = user.errors.full_messages.join(", ")
      redirect_to root_path
    end

  end

  def update
    id = params[:id]
    player =Player.find(id)
    if current_user.voted == false
      player.votes += 1
      player.save!
      current_user.voted= true
      current_user.save!
      flash[:error] = "Voted for #{player.name} Succesfully!"
      redirect_to players_path
    else
      flash[:error] = "Already Voted!"
      redirect_to players_path
    end
  end


end
