# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :department

  before_validation :adjust_attributes

  validates :name,
            presence: {
              message: 'must be present',
              code: '001'
            },
            length: {
              minimum: 3,
              too_short: 'is too short, it should be at least 3 characters long',
              code: '003'
            },
            format: {
              with: /\A[\w\s-]*\z/,
              on: :create,
              message: 'cannot contain special characters',
              code: '004'
            }

  validates :department_id,
            presence: {
              message: 'must be present.',
              code: '005'
            }

  def adjust_attributes
    self.name = name.send(:titleize)
    self.department_id = department_id.send(:to_i)
  end
end
