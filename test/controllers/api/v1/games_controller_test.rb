# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class GamesControllerTest < ActionDispatch::IntegrationTest
      include ParsedResponse
      include GamesSupport
      include GameAsserts

      setup do
        Game.delete_all

        populate_database

        @game = Game.new(year: 2024)
      end

      test 'should get index' do
        get api_v1_games_path

        assert_response :ok
        assert_equal Game.all.size, response_data.size, 'listed and total ammount of games should the same'
      end

      test 'should create game' do
        assert_difference('Game.count') do
          create_game(game_params)
        end

        assert_response :created
        game_response_asserts
      end

      test 'should not create invalid game' do
        create_game(invalid_game_params)

        assert_response :unprocessable_entity
      end

      test 'should show game' do
        Game.delete_all

        get api_v1_games_path(@game)
        assert_response :success
      end

      def create_game(params = {})
        post api_v1_games_path params: params
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
  end
end
