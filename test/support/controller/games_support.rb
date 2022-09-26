# frozen_string_literal: true

module GamesSupport
  def game_params
    {
      "game": {
        "year": '2025'
      }
    }
  end

  def invalid_game_params
    {
      "game": {
        "year": '@@@@'
      }
    }
  end

  def create_game_valid_keys
    %w[id year couples leftover]
  end

  def populate_database
    3.times do
      name = Faker::Company.unique.industry.gsub(/[^[a-zA-Zá-úÁ-ÚÑñ ]+$]/, '')
      Department.create!(name: name)
    end

    3.times do
      name = Faker::Name.unique.name.gsub(/[^[a-zA-Zá-úÁ-ÚÑñ ]+$]/, '')
      number = Department.pluck(:id).sample
      Employee.create!(name: name, department_id: number)
    end

    [2022, 2023].each { |year| Game.create(year: year) }
  end
end
