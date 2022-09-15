# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :department

  validates :name,
            presence: { message: 'debe estar presente', code: '001' },
            length: {
              minimum: 3,
              too_short: 'debe tener una longitud mínima de 3 caracteres',
              code: '003'
            },
            format: {
              with: /\A[\w\s-]*\z/,
              on: :create,
              message: 'no puede contener caracteres especiales',
              code: '004'
            }

  validates :department_id,
            presence: { message: 'debe estar presente.', code: '001' }
end
