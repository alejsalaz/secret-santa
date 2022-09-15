# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :employees

  validates :name,
            presence: { message: 'debe estar presente', code: '001' },
            uniqueness: { message: 'ya existe', code: '002' },
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
end
