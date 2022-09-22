# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :employees

  before_validation :adjust_attributes

  validates :name,
            presence: {
              message: 'must be present',
              code: '001'
            },
            uniqueness: {
              message: 'already exists',
              code: '002'
            },
            length: {
              minimum: 4,
              too_short: 'is too short, it should be at least 3 characters long',
              code: '003'
            },
            format: {
              with: /\A[a-zA-Z ]+\z/,
              on: :create,
              message: 'cannot contain special characters',
              code: '004'
            }

  # TODO: DRY
  def adjust_attributes
    self.name = name.send(:titleize) unless name.nil?
  end
end
