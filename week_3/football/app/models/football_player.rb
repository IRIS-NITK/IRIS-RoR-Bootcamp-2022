class FootballPlayer < ApplicationRecord
  # select players who have postion as forward
  scope :forwarders, -> { where(position: 'forward') }

  # select goalkeepers
  scope :goalkeepers, -> { where(position: 'defender') }

  # select players from the country France
  #
  # Note - France country code is 'FRA'
  scope :french_players, -> { where(country: 'FRA') }

  # Sort players by their rank
  scope :order_by_rank, -> { order(:rank, created_at: :asc) }

  # Average goals per game = (total goals) / (total matches)
  #
  # If total matches or total goals is missing return nil
  def average_goals_per_game
    if goals.blank? or matches_played.blank?
      nil
    else
      goals/matches_played
  end

  # Total penalty cards given = red_card + yellow_card
  #
  # If red_card or yellow_card is missing return nil
  def total_penalty_cards
    if red_card.blank? or matches_played.blank?
      nil
    else
      red_card+matches_played
  end

  # Return the penalty succes rate of the player
  # penalty_success_rate = (penalty_kicks_won * 100) / penalty_kicks_made
  # 
  # if data is missing return nil
  def penalty_success_rate
    if penalty_kicks_made.blank? or penalty_kicks_won.blank?
      nil
    else
      (penalty_kicks_made*100)/penalty_kicks_won
  end

  # create argentinian players
  def self.import_argentinian_players
    FootballPlayer.create(
    id: 1,
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
    fouls_committed: 237
    )

    FootballPlayer.create(
    id: 2,
    name: "Lucas Alario",
    rank: 50,
    country: "ARG",
    position: "forward",
    squad: "Leverkusen",
    league: "Bundesliga",
    age: 29,
    born: 1992,
    minutes_played: 665,
    goals: 79,
    penalty_kicks_made: 192,
    matches_played: 27,
    corner_kicks: 193,
    yellow_card: 148,
    red_card: 263,
    penalty_kicks_won: 64,
    fouls_committed: 172
    )
    
    FootballPlayer.create(
    id: 3,
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
    corner_kicks: 52,
    yellow_card: 74,
    red_card: 81,
    penalty_kicks_won: 134,
    fouls_committed: 146
    )
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
    
    raise ActiveRecord::RecordNotFound, stat[0] if player.nil?
    FootballPlayer.where(name: stat[0]).update(:all, goals: stat[1], minutes_played: stat[2], red_card: stat[3], yellow_card: stat[4])

  end

  # Delete the record associated with a player.
  def self.ban(name)
    FootballPlayer.find_by(name: name).destroy
  end
end
