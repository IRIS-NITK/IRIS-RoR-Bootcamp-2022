require "test_helper"

class FootballPlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @football_player = football_players(:one)
  end

  test "should get index" do
    get football_players_url
    assert_response :success
  end

  test "should get new" do
    get new_football_player_url
    assert_response :success
  end

  test "should create football_player" do
    assert_difference("FootballPlayer.count") do
      post football_players_url, params: { football_player: { age: @football_player.age, born: @football_player.born, corner_kicks: @football_player.corner_kicks, country: @football_player.country, fouls_committed: @football_player.fouls_committed, goals: @football_player.goals, league: @football_player.league, matches_played: @football_player.matches_played, minutes_played: @football_player.minutes_played, name: @football_player.name, penalty_kicks_made: @football_player.penalty_kicks_made, penalty_kicks_won: @football_player.penalty_kicks_won, position: @football_player.position, rank: @football_player.rank, red_card: @football_player.red_card, squad: @football_player.squad, yellow_card: @football_player.yellow_card } }
    end

    assert_redirected_to football_player_url(FootballPlayer.last)
  end

  test "should show football_player" do
    get football_player_url(@football_player)
    assert_response :success
  end

  test "should get edit" do
    get edit_football_player_url(@football_player)
    assert_response :success
  end

  test "should update football_player" do
    patch football_player_url(@football_player), params: { football_player: { age: @football_player.age, born: @football_player.born, corner_kicks: @football_player.corner_kicks, country: @football_player.country, fouls_committed: @football_player.fouls_committed, goals: @football_player.goals, league: @football_player.league, matches_played: @football_player.matches_played, minutes_played: @football_player.minutes_played, name: @football_player.name, penalty_kicks_made: @football_player.penalty_kicks_made, penalty_kicks_won: @football_player.penalty_kicks_won, position: @football_player.position, rank: @football_player.rank, red_card: @football_player.red_card, squad: @football_player.squad, yellow_card: @football_player.yellow_card } }
    assert_redirected_to football_player_url(@football_player)
  end

  test "should destroy football_player" do
    assert_difference("FootballPlayer.count", -1) do
      delete football_player_url(@football_player)
    end

    assert_redirected_to football_players_url
  end
end
