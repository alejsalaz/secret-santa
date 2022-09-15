# frozen_string_literal: true

module Api
  module V1
    class DepartmentsController < ApplicationController
      # GET api/v1/departments
      def index
        @departments = Department.all

        render :index
      end

      # POST api/v1/departments
      def create
        @department = Department.new(department_params)

        if @department.save
          @department
        else
          render :error, status: :unprocessable_entity
        end
      end

      private

      # Only allow a list of trusted parameters through.
      def department_params
        params.require(:department).permit(:name)
      end
    end
  end
end
