# frozen_string_literal: true

module Api
  module V1
    class DepartmentsController < ApplicationController
      def index
        @departments = Department.order(created_at: :desc)

        render :index
      end

      def create
        @department = Department.new(department_params)

        if @department.save
          render :show, status: :created
        else
          render :error, status: :unprocessable_entity
        end
      end

      private

      def department_params
        params.require(:department).permit(:name)
      end
    end
  end
end
