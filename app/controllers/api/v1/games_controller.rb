# frozen_string_literal: true

module Api
  module V1
    # Handles the representation of the games.
    class GamesController < ApplicationController
      def index
        @games = Game.all.order(:created_at)
      end

      def create
        @game = Game.new(game_params)

        if @game.save
          render :show, status: :created
        else
          render :error, status: :unprocessable_entity
        end
      end

      private

      def game_params
        params.require(:game).permit(:year)
      end
    end
  end
end
