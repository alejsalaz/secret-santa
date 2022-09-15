# frozen_string_literal: true

module Api
  module V1
    class EmployeesController < ApplicationController
      # GET api/v1/employees
      def index
        @employees = Employee.all

        render :index
      end

      # POST api/v1/employees
      def create
        @employee = Employee.new(employee_params)

        if @employee.save
          @employee
        else
          render :error, status: :unprocessable_entity
        end
      end

      private

      # Only allow a list of trusted parameters through.
      def employee_params
        params.require(:employee).permit(:name, :department_id)
      end
    end
  end
end
