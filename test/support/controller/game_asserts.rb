# frozen_string_literal: true

module GameAsserts
  def game_response_asserts
    @game = Game.find(response_data['id'])
    assert_equal create_game_valid_keys, response_data.keys, 'matching valid keys'
    assert_equal @game.year, response_data['year'], 'matching year'
    assert_couples
    assert_leftover
  end

  def assert_couples
    @game.couples.each_with_index do |couple, index|
      assert response_data['couples'].to_s.include?(couple[index.even? ? 0 : 1].name), 'matching couples'
    end
  end

  def assert_leftover
    assert_equal @game.leftover == "[]" ? 'no one was left alone this year :)' : @game.leftover,
                 response_data['leftover'], 'matching leftover'
  end
end
