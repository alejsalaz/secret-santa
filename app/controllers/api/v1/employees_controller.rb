# frozen_string_literal: true

module Api
  module V1
    class EmployeesController < ApplicationController
      def index
        @employees = Employee.order(created_at: :desc)

        render :index
      end

      def create
        @employee = Employee.new(employee_params)

        if @employee.save
          render :show, status: :created
        else
          render :error, status: :unprocessable_entity
        end
      end

      private

      def employee_params
        params.require(:employee).permit(:name, :department_id)
      end
    end
  end
end
