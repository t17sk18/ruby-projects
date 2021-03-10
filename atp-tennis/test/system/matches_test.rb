require "application_system_test_case"

class MatchesTest < ApplicationSystemTestCase
  setup do
    @match = matches(:one)
  end

  test "visiting the index" do
    visit matches_url
    assert_selector "h1", text: "Matches"
  end

  test "creating a Match" do
    visit matches_url
    click_on "New Match"

    fill_in "Avg min game", with: @match.avg_min_game
    fill_in "Avg minutes set", with: @match.avg_minutes_set
    fill_in "Avg seconds point", with: @match.avg_seconds_point
    fill_in "Date", with: @match.date
    fill_in "Matchid", with: @match.matchId
    fill_in "Match minutes", with: @match.match_minutes
    fill_in "Round", with: @match.round
    fill_in "Tournament", with: @match.tournament
    fill_in "Year", with: @match.year
    click_on "Create Match"

    assert_text "Match was successfully created"
    click_on "Back"
  end

  test "updating a Match" do
    visit matches_url
    click_on "Edit", match: :first

    fill_in "Avg min game", with: @match.avg_min_game
    fill_in "Avg minutes set", with: @match.avg_minutes_set
    fill_in "Avg seconds point", with: @match.avg_seconds_point
    fill_in "Date", with: @match.date
    fill_in "Matchid", with: @match.matchId
    fill_in "Match minutes", with: @match.match_minutes
    fill_in "Round", with: @match.round
    fill_in "Tournament", with: @match.tournament
    fill_in "Year", with: @match.year
    click_on "Update Match"

    assert_text "Match was successfully updated"
    click_on "Back"
  end

  test "destroying a Match" do
    visit matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Match was successfully destroyed"
  end
end
