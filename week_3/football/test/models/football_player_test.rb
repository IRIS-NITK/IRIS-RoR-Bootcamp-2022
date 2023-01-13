require "test_helper"

class FootballPlayerTest < ActiveSupport::TestCase
  test "has forwarders" do
    names = ["Amine Adli", "Charles Abi", "Che Adams", "Dickson Abiama", "Matthis Abline", "Sargis Adamyan", "Tammy Abraham"]

    assert_equal names, FootballPlayer.forwarders.order(name: :asc).pluck(:name)
  end

  test "has french_player" do
    names = ["Amine Adli", "Charles Abi", "Laurent Abergel", "Martin Adeline", "Matthis Abline", "Mohamed Achi", "Yacine Adli"]

    assert_equal names, FootballPlayer.french_players.order(name: :asc).pluck(:name)
  end

  test "has order_by_rank" do
    names = ["Max Aarons",
    "Yunis Abdelhamid",
    "Salis Abdul Samed",
    "Laurent Abergel",
    "Charles Abi",
    "Dickson Abiama",
    "Matthis Abline",
    "Tammy Abraham",
    "Luis Abram",
    "Francesco Acerbi",
    "Ragnar Ache",
    "Mohamed Achi",
    "Che Adams",
    "Tyler Adams",
    "Sargis Adamyan",
    "Martin Adeline",
    "Amine Adli",
    "Yacine Adli",
    "Michel Aebischer"]

    assert_equal names, FootballPlayer.order_by_rank.pluck(:name)
  end

  test "has self.import_argentinian_players" do
    players = ["Lucas Alario", "Marcos Acuna", "Sergio Aguero"]

    FootballPlayer.import_argentinian_players

    assert_equal players, FootballPlayer.where(name: players).order(name: :asc).pluck(:name)
  end

  test "has average_goals_per_game" do
    assert_equal 2, FootballPlayer.new(matches_played: 10, goals: 20).average_goals_per_game
    assert_equal 5, FootballPlayer.new(matches_played: 10, goals: 50).average_goals_per_game
  end

  test "average_goals_per_game is nil when data is incomplete" do
    assert_nil FootballPlayer.new(goals: 20).average_goals_per_game
    assert_nil FootballPlayer.new(matches_played: 10).average_goals_per_game
  end

  test "has total_penalty_cards" do
    assert_equal 30, FootballPlayer.new(red_card: 10, yellow_card: 20).total_penalty_cards
    assert_equal 60, FootballPlayer.new(yellow_card: 10, red_card: 50).total_penalty_cards
  end

  test "total_penalty_cards is nil when data is incomplete" do
    assert_nil FootballPlayer.new(red_card: 20).total_penalty_cards
    assert_nil FootballPlayer.new(yellow_card: 10).total_penalty_cards
  end

  test "has penalty_success_rate" do
    assert_equal 50, FootballPlayer.new(penalty_kicks_won: 5, penalty_kicks_made: 10).penalty_success_rate
    assert_equal 10, FootballPlayer.new(penalty_kicks_won: 1, penalty_kicks_made: 10).penalty_success_rate
  end

  test "has self.ban" do
    FootballPlayer.ban("Tammy Abraham")
    assert_empty FootballPlayer.where(name: "Tammy Abraham")
  end

  test "has self.update_statistics" do
    stat = [
      ["Salis Abdul Samed", 2, 30, 1, 1],
      ["Dickson Abiama", 4, 20, 1, 0]
    ]

    FootballPlayer.update_statistics(stat)

    assert_equal [["Dickson Abiama", 37, 746, 121, 104]], FootballPlayer.where(name: "Dickson Abiama").pluck(:name, :goals, :minutes_played, :red_card, :yellow_card)      
    assert_equal [["Salis Abdul Samed", 32, 2492, 136, 270]], FootballPlayer.where(name: "Salis Abdul Samed").pluck(:name, :goals, :minutes_played, :red_card, :yellow_card)
  end
end
