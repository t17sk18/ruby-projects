require 'test_helper'

class MatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @match = matches(:one)
  end

  test "should get index" do
    get matches_url
    assert_response :success
  end

  test "should get new" do
    get new_match_url
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post matches_url, params: { match: { avg_min_game: @match.avg_min_game, avg_minutes_set: @match.avg_minutes_set, avg_seconds_point: @match.avg_seconds_point, date: @match.date, matchId: @match.matchId, match_minutes: @match.match_minutes, round: @match.round, tournament: @match.tournament, year: @match.year } }
    end

    assert_redirected_to match_url(Match.last)
  end

  test "should show match" do
    get match_url(@match)
    assert_response :success
  end

  test "should get edit" do
    get edit_match_url(@match)
    assert_response :success
  end

  test "should update match" do
    patch match_url(@match), params: { match: { avg_min_game: @match.avg_min_game, avg_minutes_set: @match.avg_minutes_set, avg_seconds_point: @match.avg_seconds_point, date: @match.date, matchId: @match.matchId, match_minutes: @match.match_minutes, round: @match.round, tournament: @match.tournament, year: @match.year } }
    assert_redirected_to match_url(@match)
  end

  test "should destroy match" do
    if @email === true 
      assert_difference('Match.count', -1) do
        delete match_url(@match)
      end

      assert_redirected_to matches_url
    end
  end
end
