class FootballPlayer < ApplicationRecord
  # select players who have postion as forward
  scope :forwarders, -> { where(position: "forward") }

  # select goalkeepers
  scope :goalkeepers, -> { where(position: "goalkeeper") }

  # select players from the country France
  #
  # Note - France country code is 'FRA'
  scope :french_players, -> { where(country: "FRA") }

  # Sort players by their rank
  scope :order_by_rank, -> { order(rank: :asc) }

  # Average goals per game = (total goals) / (total matches)
  #
  # If total matches or total goals is missing return nil
  def average_goals_per_game
    return nil if goals.nil? || matches_played.nil?
    goals / matches_played
  end

  # Total penalty cards given = red_card + yellow_card
  #
  # If red_card or yellow_card is missing return nil
  def total_penalty_cards
    return nil if red_card.nil? || yellow_card.nil?
    red_card + yellow_card
  end

  # Return the penalty succes rate of the player
  # penalty_success_rate = (penalty_kicks_won * 100) / penalty_kicks_made
  # 
  # if data is missing return nil
  def penalty_success_rate
    return nil if penalty_kicks_won.nil? || penalty_kicks_made.nil?
    (penalty_kicks_won * 100) / penalty_kicks_made
  end

  # create argentinian players
  def self.import_argentinian_players
    FootballPlayer.create(name: "Marcos Acuna", position: "defender", country: "ARG")
    FootballPlayer.create(name: "Lucas Alario", position: "forward", country: "ARG")
    FootballPlayer.create(name: "Sergio Aguero", position: "forward", country: "ARG")
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
    stat.each do |s|
      player = FootballPlayer.find_by(name: s[0])

      raise ActiveRecord::RecordNotFound.new(z[0]) if player.nil?

      player.goals += s[1]
      player.minutes_played += s[2]
      player.red_card += s[3]
      player.yellow_card += s[4]
      player.save
    end
  end

  # Delete the record associated with a player.
  def self.ban(name)
    where(name: name).destroy_all
  end
end
