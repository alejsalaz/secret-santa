# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class DepartmentsControllerTest < ActionDispatch::IntegrationTest
      include ParsedResponse
      include DepartmentsSupport
      include DepartmentAsserts

      setup do
        @department = departments(:department_one)
      end

      test 'should get index' do
        get api_v1_departments_path

        assert_response :ok
        assert_equal Department.all.size, response_data.size, 'listed and total ammount of departments should the same'
      end

      test 'should create department' do
        assert_difference('Department.count') do
          create_department(department_params)
        end

        assert_response :created
        department_response_asserts
      end

      test 'should not create invalid department' do
        create_department(invalid_department_params)

        assert_response :unprocessable_entity
      end

      test 'should show department' do
        get api_v1_departments_path(@department)
        assert_response :success
      end

      def create_department(params = {})
        post api_v1_departments_path params: params
      end
    end
  end
end
