class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to players_path, notice: "The player has been created!" and return
    end

    render 'new'
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update_attributes(player_params)
      redirect_to players_path, notice: "#{@player.first_name} #{@player.last_name} has been updated!" and return
    end

    render 'edit'
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    redirect_to players_path, notice: "#{@player.first_name} #{@player.last_name} has been deleted!" and return
  end

private
  def player_params
    params.require(:player).permit(:first_name, :last_name, :age, :position, :team)
  end

end
