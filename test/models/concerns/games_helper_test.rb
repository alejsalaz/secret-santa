# frozen_string_literal: true

require 'test_helper'

class GamesHelperTest < ActiveSupport::TestCase
  include GamesHelper

  attr_accessor :couples, :leftover, :year

  setup do
    @year = 2022

    Game.delete_all
  end

  test 'cannot create couples with only two employees' do
    Employee.delete_all

    assert_equal append_attributes, [], 'couples and leftover should equal an empty array'
  end

  test 'couples cannot be together for two years' do
    100.times do
      (2022..2031).each { |year| Game.create(year: year) }

      (2022..2031).each do |year|
        couples = Game.find_by(year: year).couples
        future_couples = Game.find_by(year: year + 1).couples if year < 2031
        after_future_couples = Game.find_by(year: year + 2).couples if year < 2030

        if year < 2031
          couples.each do |couple|
            future_couples.each do |future_couple|
              assert false if future_couple.sort == couple.sort
            end

            next if after_future_couples.nil?

            after_future_couples.each do |after_future_couple|
              assert false if after_future_couple.sort == couple.sort
            end
          end
        end
      end

      assert true
    end
  end

  test 'the same person cannot be left out for two years in a row' do
    100.times do
      (2022..2031).each { |year| Game.create(year: year) }

      (2022..2031).each do |year|
        leftover = Game.find_by(year: year).leftover
        future_leftover = Game.find_by(year: year + 1).leftover if year < 2031

        assert false if future_leftover == leftover
      end

      assert true
    end
  end
end
