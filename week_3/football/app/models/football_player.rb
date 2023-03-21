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
    total_goals = FootballPlayer.where(goals: true).sum(:goals)
    total_matches = FootballPlayer.where(matches_played: true).sum(:matches_played)
    return nil if total_goals.zero? || total_matches.zero?
    return total_goals.to_f/total_matches.to_f
    
  end

  # Total penalty cards given = red_card + yellow_card
  #
  # If red_card or yellow_card is missing return nil
  def total_penalty_cards
    red_card = FootballPlayer.where(red_card: true).sum(:red_card)
    yellow_card = FootballPlayer.where(yellow_card: true).sum(:yellow_card)
    return nil if red_card.nil? || yellow_card.nil?
    red_card + yellow_card
    
  end

  # Return the penalty succes rate of the player
  # penalty_success_rate = (penalty_kicks_won * 100) / penalty_kicks_made
  # 
  # if data is missing return nil
  def penalty_success_rate
    penalty_kicks_won = FootballPlayer.where(penalty_kicks_won: true).sum(:penalty_kicks_won)
    penalty_kicks_made = FootballPlayer.where(penalty_kicks_made: true).sum(:penalty_kicks_made)
    return nil if penalty_kicks_made.zero? || penalty_kicks_won.zero?
    (penalty_kicks_won * 100) / penalty_kicks_made
    
  end

  # create argentinian players
  def self.import_argentinian_players
    players = [
      {player_id: 1,
      name: "Marcos Acuna",
      rank: 13,
      country: "ARG",
      position: "defender",
      squad: "Sevilla",
      league: "La Liga",
      age: 30,
      born: 1991,
      minutes_played: 2260,
      goals: 105,
      penalty_kicks_made: 705,
      matches_played: 31,
      corner_kicks: 248,
      yellow_card: 81,
      red_card: 267,
      penalty_kicks_won: 235,
      fouls_committed: 237},

      {player_id: 2,
      name: "Lucas Alario",
      rank: 50,
      country: "ARG",
      position: "forward",
      squad: "Leverkusen",
      league: "Bundesliga",
      age: 29,
      born: 1992,
      minutes_played: 655,
      goals: 79,
      penalty_kicks_made: 192,
      matches_played: 27,
      corner_kicks: 193,
      yellow_card: 148,
      red_card: 263,
      penalty_kicks_won: 64,
      fouls_committed: 172},

      {
        player_id: 3,
        name: "Sergio Agüero",
        rank: 27,
        country: "ARG",
        position: "forward",
        squad: "Barcelona",
        league: "La Liga",
        age: 33,
        born: 1988,
        minutes_played: 151,
        goals: 179,
        penalty_kicks_made: 402,
        matches_played: 4,
        corner_kicks: 4,
        yellow_card: 4,
        red_card: 3,
        penalty_kicks_won: 4,
        fouls_committed: 1
      }
    ]

    players.each do |players_obj|
      FootballPlayer.create(players_obj)
    
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
    stat.each do |player_data|
      player_name, goals, minutes_played, red_card, yellow_card = player_data
      player = FootballPlayer.find_by(name: player_name)
      if player.nil?
        raise ActiveRecord::RecordNotFound, "Player #{player_name} not found"
      end
      player.update(goals: player.goals + goals, minutes_played: player.minutes_played + minutes_played, red_card: player.red_card + red_card, yellow_card: player.yellow_card + yellow_card)
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
