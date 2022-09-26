# frozen_string_literal: true

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  setup do
    @game = games(:game_one)
  end
  # Columns
  test 'has a valid column named year' do
    assert Game.column_names.include?('year'), 'year column is included'
    assert_equal 'integer', game_column_class('year').type.to_s, 'year column is an integer'
    assert_not game_column_class('year').null, 'year column is not null'
  end

  test 'has a valid column named leftover' do
    assert Game.column_names.include?('leftover'), 'leftover column is included'
    assert_equal 'text', game_column_class('leftover').type.to_s, 'leftover column is a text column'
    assert_not game_column_class('leftover').null, 'leftover column is not null'
  end

  test 'has a valid column named couples' do
    assert Game.column_names.include?('couples'), 'couples column is included'
    assert_equal 'text', game_column_class('couples').type.to_s, 'couples column is a text column'
    assert_not game_column_class('couples').null, 'couples column is not null'
  end
  # Validations
  test 'valid years range from 2022 to 2031' do
    @game.year = '1'

    refute @game.valid?, 'invalid year out of range acting as a valid one'
    assert @game.errors[:year].present?, 'invalid year out of range with no defined error'
    assert @game.errors.details[:year][0][:code].present?, 'invalid year out of range with no code error'
  end

  test 'cannot create a game with less than two employees' do
    Employee.delete_all
    Employee.create(name: 'John', department_id: Department.first.id)

    game = Game.new(year: 2031)

    refute game.valid?, 'invalid game acting as a valid one'
    assert game.errors[:couples].present?, 'invalid game with no defined error'
    assert game.errors.details[:couples][0][:code].present?, 'invalid game with no code error'
  end
  # Methods
  def game_column_class(column)
    Game.columns.detect { |each| each.name == column.to_s }
  end
end
