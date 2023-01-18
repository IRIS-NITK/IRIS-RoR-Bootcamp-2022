class FootballPlayer < ApplicationRecord
  # select players who have postion as forward
  scope :forwarders, -> { where(position: 'forward') }

  # select goalkeepers
  scope :goalkeepers, -> { where(position: 'goalkeeper') }

  # select players from the country France
  #
  # Note - France country code is 'FRA'
  scope :french_players, -> { where(country: 'FRA') }

  # Sort players by their rank
  scope :order_by_rank, -> { order(rank: :asc) }

  # Average goals per game = (total goals) / (total matches)
  #
  # If total matches or total goals is missing return nil
  def average_goals_per_game
    return nil if !defined?(goals) || !defined?(matches_played) || matches_played == 0
    goals.to_f / matches_played
  end


  # Total penalty cards given = red_card + yellow_card
  #
  # If red_card or yellow_card is missing return nil
  def total_penalty_cards
    return nil if !defined?(red_card) || !defined?(yellow_card)
    red_card + yellow_card
  end

  # Return the penalty succes rate of the player
  # penalty_success_rate = (penalty_kicks_won * 100) / penalty_kicks_made
  # 
  # if data is missing return nil
  def penalty_success_rate
    return nil if !defined?(penalty_kicks_made) || !defined?(penalty_kicks_won)
    (penalty_kicks_won * 100) / penalty_kicks_made
  end

  # create argentinian players
  def self.import_argentinian_players
    players = [
      ["Marcos Acuna", 13, "ARG", "defender", "Sevilla", "La Liga", 30, "1991", 2260, 105, 705, 31, 248, 81, 267, 235, 237],
      ["Lucas Alario", 50, "ARG", "forward", "Leverkusen", "Bundesliga", 29, "1992", 655, 79, 192, 27, 193, 148, 263, 64, 172],
      ["Sergio Aguero", 27, "ARG", "forward", "Barcelona", "La Liga", 33, "1988", 151, 179, 402, 4, 52,74, 81, 134, 146]
    ]
    players.each do |player|
      FootballPlayer.create(name: player[0], rank: player[1], country: player[2], position: player[3], squad: player[4], league: player[5], age: player[6], born: player[7], minutes_played: player[8], goals: player[9], penalty_kicks_made: player[10], matches_played: player[11], corner_kicks: player[12], yellow_card: player[13], red_card: player[14], penalty_kicks_won: player[15], fouls_committed: player[16])
    end
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
    player = FootballPlayer.find_or_create_by(name: stat[0])
    player.goals += stat[1]
    player.minutes_played += stat[2]
    player.red_card += stat[3]
    player.yellow_card += stat[4]
    player.save
  end


  # Delete the record associated with a player.
  def self.ban(name)
    player = FootballPlayer.find_by(name: name)
    if player.nil?
        raise ActiveRecord::RecordNotFound
    end
    player.destroy
  end
end
