# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class EmployeesControllerTest < ActionDispatch::IntegrationTest
      include ParsedResponse
      include EmployeesSupport
      include EmployeeAsserts

      setup do
        @employee = employees(:employee_one)
      end

      test 'should get index' do
        get api_v1_employees_path

        assert_response :ok
        assert_equal Employee.all.size, response_data.size, 'listed and total ammount of employees should the same'
      end

      test 'should create employee' do
        assert_difference('Employee.count') do
          create_employee(employee_params)
        end

        assert_response :created
        employee_response_asserts
      end

      test 'should not create invalid employee' do
        create_employee(invalid_employee_params)

        assert_response :unprocessable_entity
      end

      test 'should show employee' do
        get api_v1_employees_path(@employee)
        assert_response :success
      end

      def create_employee(params = {})
        post api_v1_employees_path params: params
      end
    end
  end
end
