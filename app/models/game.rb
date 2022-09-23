# frozen_string_literal: true

class Game < ApplicationRecord
  include GamesHelper

  serialize :couples, Array

  before_validation :append_attributes

  validates :year,
            presence: {
              message: 'must be present',
              code: '006'
            },
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 2022,
              less_than_or_equal_to: 2031,
              message: 'must be a number between 2022 and 2031',
              code: '007'
            },
            uniqueness: {
              message: 'already exists',
              code: '008'
            }

  validates :couples,
            length: {
              minimum: 2,
              message: 'must have at least two employees',
              code: '009'
            }

  private

  def append_attributes
    if Employee.all.count >= 2
      self.couples = find_couples(year)
      self.leftover = find_leftover
    else
      self.couples = self.leftover = []
    end
  end
end
