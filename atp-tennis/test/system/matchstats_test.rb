require "application_system_test_case"

class MatchstatsTest < ApplicationSystemTestCase
  setup do
    @matchstat = matchstats(:one)
  end

  test "visiting the index" do
    visit matchstats_url
    assert_selector "h1", text: "Matchstats"
  end

  test "creating a Matchstat" do
    visit matchstats_url
    click_on "New Matchstat"

    fill_in "Aces", with: @matchstat.aces
    fill_in "Avg odds", with: @matchstat.avg_odds
    fill_in "Bp faced", with: @matchstat.bp_faced
    fill_in "Bp saved", with: @matchstat.bp_saved
    fill_in "Dbl faults", with: @matchstat.dbl_faults
    fill_in "First serve in", with: @matchstat.first_serve_in
    fill_in "First serve rtn won", with: @matchstat.first_serve_rtn_won
    fill_in "First server per", with: @matchstat.first_server_per
    fill_in "Matchid", with: @matchstat.matchId
    fill_in "Match", with: @matchstat.match_id
    fill_in "Max odds", with: @matchstat.max_odds
    fill_in "Playerid", with: @matchstat.playerId
    fill_in "Player", with: @matchstat.player_id
    fill_in "Points", with: @matchstat.points
    fill_in "Rank", with: @matchstat.rank
    fill_in "Return pt", with: @matchstat.return_pt
    fill_in "Second serve rtn won", with: @matchstat.second_serve_rtn_won
    fill_in "Serve pt", with: @matchstat.serve_pt
    fill_in "Set1", with: @matchstat.set1
    fill_in "Set2", with: @matchstat.set2
    fill_in "Set3", with: @matchstat.set3
    fill_in "Set4", with: @matchstat.set4
    fill_in "Set5", with: @matchstat.set5
    fill_in "Sets", with: @matchstat.sets
    fill_in "Statid", with: @matchstat.statId
    fill_in "Total pts", with: @matchstat.total_pts
    check "Winner" if @matchstat.winner
    click_on "Create Matchstat"

    assert_text "Matchstat was successfully created"
    click_on "Back"
  end

  test "updating a Matchstat" do
    visit matchstats_url
    click_on "Edit", match: :first

    fill_in "Aces", with: @matchstat.aces
    fill_in "Avg odds", with: @matchstat.avg_odds
    fill_in "Bp faced", with: @matchstat.bp_faced
    fill_in "Bp saved", with: @matchstat.bp_saved
    fill_in "Dbl faults", with: @matchstat.dbl_faults
    fill_in "First serve in", with: @matchstat.first_serve_in
    fill_in "First serve rtn won", with: @matchstat.first_serve_rtn_won
    fill_in "First server per", with: @matchstat.first_server_per
    fill_in "Matchid", with: @matchstat.matchId
    fill_in "Match", with: @matchstat.match_id
    fill_in "Max odds", with: @matchstat.max_odds
    fill_in "Playerid", with: @matchstat.playerId
    fill_in "Player", with: @matchstat.player_id
    fill_in "Points", with: @matchstat.points
    fill_in "Rank", with: @matchstat.rank
    fill_in "Return pt", with: @matchstat.return_pt
    fill_in "Second serve rtn won", with: @matchstat.second_serve_rtn_won
    fill_in "Serve pt", with: @matchstat.serve_pt
    fill_in "Set1", with: @matchstat.set1
    fill_in "Set2", with: @matchstat.set2
    fill_in "Set3", with: @matchstat.set3
    fill_in "Set4", with: @matchstat.set4
    fill_in "Set5", with: @matchstat.set5
    fill_in "Sets", with: @matchstat.sets
    fill_in "Statid", with: @matchstat.statId
    fill_in "Total pts", with: @matchstat.total_pts
    check "Winner" if @matchstat.winner
    click_on "Update Matchstat"

    assert_text "Matchstat was successfully updated"
    click_on "Back"
  end

  test "destroying a Matchstat" do
    visit matchstats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Matchstat was successfully destroyed"
  end
end
