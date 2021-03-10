require 'test_helper'

class MatchstatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matchstat = matchstats(:one)
  end

  test "should get index" do
    get matchstats_url
    assert_response :success
  end

  test "should get new" do
    get new_matchstat_url
    assert_response :success
  end

  test "should create matchstat" do
    assert_difference('Matchstat.count') do
      post matchstats_url, params: { matchstat: { aces: @matchstat.aces, avg_odds: @matchstat.avg_odds, bp_faced: @matchstat.bp_faced, bp_saved: @matchstat.bp_saved, dbl_faults: @matchstat.dbl_faults, first_serve_in: @matchstat.first_serve_in, first_serve_rtn_won: @matchstat.first_serve_rtn_won, first_server_per: @matchstat.first_server_per, matchId: @matchstat.matchId, match_id: @matchstat.match_id, max_odds: @matchstat.max_odds, playerId: @matchstat.playerId, player_id: @matchstat.player_id, points: @matchstat.points, rank: @matchstat.rank, return_pt: @matchstat.return_pt, second_serve_rtn_won: @matchstat.second_serve_rtn_won, serve_pt: @matchstat.serve_pt, set1: @matchstat.set1, set2: @matchstat.set2, set3: @matchstat.set3, set4: @matchstat.set4, set5: @matchstat.set5, sets: @matchstat.sets, statId: @matchstat.statId, total_pts: @matchstat.total_pts, winner: @matchstat.winner } }
    end

    assert_redirected_to matchstat_url(Matchstat.last)
  end

  test "should show matchstat" do
    get matchstat_url(@matchstat)
    assert_response :success
  end

  test "should get edit" do
    get edit_matchstat_url(@matchstat)
    assert_response :success
  end

  test "should update matchstat" do
    patch matchstat_url(@matchstat), params: { matchstat: { aces: @matchstat.aces, avg_odds: @matchstat.avg_odds, bp_faced: @matchstat.bp_faced, bp_saved: @matchstat.bp_saved, dbl_faults: @matchstat.dbl_faults, first_serve_in: @matchstat.first_serve_in, first_serve_rtn_won: @matchstat.first_serve_rtn_won, first_server_per: @matchstat.first_server_per, matchId: @matchstat.matchId, match_id: @matchstat.match_id, max_odds: @matchstat.max_odds, playerId: @matchstat.playerId, player_id: @matchstat.player_id, points: @matchstat.points, rank: @matchstat.rank, return_pt: @matchstat.return_pt, second_serve_rtn_won: @matchstat.second_serve_rtn_won, serve_pt: @matchstat.serve_pt, set1: @matchstat.set1, set2: @matchstat.set2, set3: @matchstat.set3, set4: @matchstat.set4, set5: @matchstat.set5, sets: @matchstat.sets, statId: @matchstat.statId, total_pts: @matchstat.total_pts, winner: @matchstat.winner } }
    assert_redirected_to matchstat_url(@matchstat)
  end

  test "should destroy matchstat" do
    assert_difference('Matchstat.count', -1) do
      delete matchstat_url(@matchstat)
    end

    assert_redirected_to matchstats_url
  end
end
