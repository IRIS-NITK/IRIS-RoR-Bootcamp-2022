class FootballPlayer < ApplicationRecord
  # select players who have postion as forward
  scope :forwarders, -> { raise NotImplementedError }

  # select goalkeepers
  scope :goalkeepers, -> { raise NotImplementedError }

  # select players from the country France
  #
  # Note - France country code is 'FRA'
  scope :french_players, -> { raise NotImplementedError }

  # Sort players by their rank
  scope :order_by_rank, -> { raise NotImplementedError }

  # Average goals per game = (total goals) / (total matches)
  #
  # If total matches or total goals is missing return nil
  def average_goals_per_game
    raise NotImplementedError
  end

  # Total penalty cards given = red_card + yellow_card
  #
  # If red_card or yellow_card is missing return nil
  def total_penalty_cards
    raise NotImplementedError
  end

  # Return the penalty succes rate of the player
  # penalty_success_rate = (penalty_kicks_won * 100) / penalty_kicks_made
  # 
  # if data is missing return nil
  def penalty_success_rate
    raise NotImplementedError
  end

  # create argentinian players
  def self.import_argentinian_players
    raise NotImplementedError
  end

  # Update the statistics of a player after a game
  #
  # The data is given as an array of the following type:
  # [player name, goals, minutes_played, red_card, yellow_card]

  # Eg-
  # [
  #   ["Sergio Aguero", 2, 30, 0, 0]
  #   ["Messi", 1, 30, 1, 0]
  #   ...
  #   ...
  #   ["Ronaldo", 3, 20, 1, 0]
  # ]
  #
  # Note: If you cannot find a player with given name, raise an
  # `ActiveRecord::RecordNotFound` exception with the player's name as
  # the message.
  def self.update_statistics(stat)
    raise NotImplementedError
  end

  # Delete the record associated with a player.
  def self.ban(name)
    raise NotImplementedError
  end
end
