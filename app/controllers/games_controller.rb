class GamesController < ApplicationController

  def new
    @player = Player.find(params[:player_id])
    @game = Game.new(player_id: @player.id)
  end

  def create
    @player = Player.find(params[:player_id])

    @game = Game.new(game_params)
    @game.won = (@game.guess == @game.color)

    if @game.save
      redirect_to @player
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:guess).merge({
      player_id: params[:player_id],
      color: Game.random_color
      })
  end

  # params.require(:game).permit(:color) will look like
  # { guess: "blue" }
  # so by merging, we'll upgrade game_params to look like
  # { guess: "blue", player_id: 3, color: "red" }
end
