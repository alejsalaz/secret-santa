# frozen_string_literal: true

require 'test_helper'

class ParametersHelperTest < ActiveSupport::TestCase
  include ParametersHelper

  attr_accessor :department_id, :year, :name

  test 'string department should become integer' do
    @department_id = '1'
    assert_equal @department_id.to_i, numerify_department
  end

  test 'a nil department should stay nil' do
    @department_id = nil
    assert_nil numerify_department
  end

  test 'string year should become integer' do
    @year = '1'
    assert_equal @year.to_i, numerify_year
  end

  test 'nil year should stay nil' do
    @year = nil
    assert_nil numerify_year
  end

  test 'name should get titleized' do
    @name = 'juan'
    assert_equal @name.titleize, titleize_name
  end

  test 'nil name should stay nil' do
    @name = nil
    assert_nil titleize_name
  end
end
