# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class DepartmentsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @department = departments(:department_one)
      end

      test 'should get index' do
        # get api_v1_departments_path, as: :json
        # assert_response :success
        get departments_url
        assert_response :success
        # get api_v1_departments_path

        # assert_response :ok
        # asser_equal Department.all.size, response_data.size, ''
      end

      test 'should create department' do
        # assert_difference('Department.count') do
        #   post api_v1_departments_path, params: { department: { name: @department.name } }, as: :json
        # end

        # assert_response :created

      end

      test 'should show department' do
        # get department_url(@department), as: :json
        # assert_response :success

      end
    end
  end
end
