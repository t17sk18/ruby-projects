require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:one)
    @email = User.new(email: 'testuser@tennis.com')
    
  end

  test "should get index" do
    get players_url
    assert_response :success
  end

  test "should get new" do
    get new_player_url
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count', 1) do
      post players_url, params: { player: { birthday: @player.birthday, country: @player.country, hand: @player.hand, isocode_id: @player.isocode_id, name: @player.name, playerId: @player.playerId } }
    end

    assert_redirected_to player_url(Player.last)
  end

  test "should show player" do
    get player_url(@player)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_url(@player)
    assert_response :success
  end

  test "should update player" do
    patch player_url(@player), params: { player: { birthday: @player.birthday, country: @player.country, hand: @player.hand, isocode_id: @player.isocode_id, name: @player.name, playerId: @player.playerId } }
    assert_redirected_to player_url(@player)
  end

  test "should destroy player" do
  if @email === true 
      assert_difference('Player.count', -1) do
        delete player_url(@player.id)
      end

      assert_redirected_to players_url
    end
  end
end
