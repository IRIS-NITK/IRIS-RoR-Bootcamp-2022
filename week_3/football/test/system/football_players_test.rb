require "application_system_test_case"

class FootballPlayersTest < ApplicationSystemTestCase
  setup do
    @football_player = football_players(:one)
  end

  test "visiting the index" do
    visit football_players_url
    assert_selector "h1", text: "Football players"
  end

  test "should create football player" do
    visit football_players_url
    click_on "New football player"

    fill_in "Age", with: @football_player.age
    fill_in "Born", with: @football_player.born
    fill_in "Corner kicks", with: @football_player.corner_kicks
    fill_in "Country", with: @football_player.country
    fill_in "Fouls committed", with: @football_player.fouls_committed
    fill_in "Goals", with: @football_player.goals
    fill_in "League", with: @football_player.league
    fill_in "Matches played", with: @football_player.matches_played
    fill_in "Minutes played", with: @football_player.minutes_played
    fill_in "Name", with: @football_player.name
    fill_in "Penalty kicks made", with: @football_player.penalty_kicks_made
    fill_in "Penalty kicks won", with: @football_player.penalty_kicks_won
    fill_in "Position", with: @football_player.position
    fill_in "Rank", with: @football_player.rank
    fill_in "Red card", with: @football_player.red_card
    fill_in "Squad", with: @football_player.squad
    fill_in "Yellow card", with: @football_player.yellow_card
    click_on "Create Football player"

    assert_text "Football player was successfully created"
    click_on "Back"
  end

  test "should update Football player" do
    visit football_player_url(@football_player)
    click_on "Edit this football player", match: :first

    fill_in "Age", with: @football_player.age
    fill_in "Born", with: @football_player.born
    fill_in "Corner kicks", with: @football_player.corner_kicks
    fill_in "Country", with: @football_player.country
    fill_in "Fouls committed", with: @football_player.fouls_committed
    fill_in "Goals", with: @football_player.goals
    fill_in "League", with: @football_player.league
    fill_in "Matches played", with: @football_player.matches_played
    fill_in "Minutes played", with: @football_player.minutes_played
    fill_in "Name", with: @football_player.name
    fill_in "Penalty kicks made", with: @football_player.penalty_kicks_made
    fill_in "Penalty kicks won", with: @football_player.penalty_kicks_won
    fill_in "Position", with: @football_player.position
    fill_in "Rank", with: @football_player.rank
    fill_in "Red card", with: @football_player.red_card
    fill_in "Squad", with: @football_player.squad
    fill_in "Yellow card", with: @football_player.yellow_card
    click_on "Update Football player"

    assert_text "Football player was successfully updated"
    click_on "Back"
  end

  test "should destroy Football player" do
    visit football_player_url(@football_player)
    click_on "Destroy this football player", match: :first

    assert_text "Football player was successfully destroyed"
  end
end
