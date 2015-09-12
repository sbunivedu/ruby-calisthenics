class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    p1_strategy = player1[1]
    p2_strategy = player2[1]
    unless legal_strategies(p1_strategy, p2_strategy)
      raise NoSuchStrategyError
    else
      return player_one_wins(p1_strategy, p2_strategy) ? player1 : player2
    end
  end

  def self.tournament_winner(tournament)
    if tournament[0][0].kind_of?(Array) && tournament[-1][0].kind_of?(Array)
      return self.winner(self.tournament_winner[0], self.tournament_winner[-1])
    else
      return self.winner(tournament[0], tournament[1])
    end
  end
end

class RockPaperScissors
  # Helper Methods
  def self.player_one_wins(p1_strategy, p2_strategy)
    if p1_strategy == p2_strategy
      return true
    elsif p1_strategy == 'R'
      return p2_strategy != 'P'
    elsif p1_strategy == 'P'
      return p2_strategy != 'S'
    else
      return p2_strategy != 'R'
    end
  end

  def self.legal_strategies(p1_strategy, p2_strategy)
    return legal_strategy(p1_strategy) && legal_strategy(p2_strategy)
  end

  def self.legal_strategy strategy
    ['R', 'P', 'S'].include? strategy
  end

  def is_game?(arr)
    x = 2
  end
end
