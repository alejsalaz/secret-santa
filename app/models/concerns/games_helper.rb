# frozen_string_literal: true

# Handles the generation of valid couples and leftovers inside the GamesController.
module GamesHelper
  def append_attributes
    if Employee.all.count >= 2 && year.present?
      self.couples = find_couples(year)
      self.leftover = find_leftover
    else
      self.couples = self.leftover = []
    end
  end

  def find_couples(played_year)
    generate_couples until valid_couple?(played_year)

    Employee.all.count.even? ? @couples : @couples[0...-1]
  end

  def generate_couples
    @couples = Employee.all.shuffle.each_slice(2).to_a
  end

  def find_leftover
    Employee.all.count.odd? ? @couples[-1] : []
  end

  def valid_couple?(played_year)
    return false if @couples.nil?

    past_game = Game.find_by(year: played_year - 1)

    return true if past_game.nil?

    return false if past_game.leftover == @couples[-1].to_s

    # TODO: Use hash set
    @couples.each do |current_couple|
      past_game.couples.each do |past_couple|
        return false if past_couple.sort == current_couple.sort
      end
    end

    true
  end
end
