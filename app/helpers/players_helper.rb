module PlayersHelper

  def winning_percent(player)
    return 0 if player.games.none?

    win_count = player.games.where(won: true).count
    total_count = player.games.count

    return 100.0 * win_count / total_count
  end
  
end
