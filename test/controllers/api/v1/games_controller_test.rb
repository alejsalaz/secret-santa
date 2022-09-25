# frozen_string_literal: true

require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:game_one)
  end

  test 'should get index' do
    get games_url, as: :json
    assert_response :success
  end

  test 'should create game' do
    assert_difference('Game.count') do
      post games_url, params: { game: { couples: @game.couples, leftover: @game.leftover, year: @game.year } },
                      as: :json
    end

    assert_response :created
  end

  test 'should show game' do
    get game_url(@game), as: :json
    assert_response :success
  end
end
