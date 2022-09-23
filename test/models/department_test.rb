# frozen_string_literal: true

require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  def setup
    @department = departments(:department_one)
    @employee = employees(:employee_one)
  end

  # Columns
  test 'has a valid column named name' do
    assert Department.column_names.include?('name'), 'name column is included in Department table'
    assert_equal 'string', department_column_class('name').type.to_s, 'name column is a string'
    assert_not department_column_class('name').null, 'name column is not null'
  end
  # Relations
  test 'is related with employees' do
    assert_equal @department, @employee.department
  end
  # Validations
  test 'cannot have a nil name' do
    @department.name = nil

    refute @department.valid?, 'invalid nil name acting as a valid one'
    assert @department.errors[:name].present?, 'invalid nil name with no defined error'
  end

  test 'cannot have a name less than three characters long' do
    @department.name = 'foo'

    refute @department.valid?, 'invalid three characters long name acting as a valid one'
    assert @department.errors[:name].present?, 'invalid three characters long name with no defined error'
  end

  test 'names must be unique' do
    Department.create(name: 'Test')

    invalid_department = Department.new(name: 'Test')

    refute invalid_department.valid?, 'invalid not unique name acting as a valid one'
    assert invalid_department.errors[:name].present?, 'invalid not unique name with no defined error'
  end

  test 'cannot have a name with insecure characters' do
    @department.name = '@@@@'

    refute @department.valid?, 'invalid name name with insecure characters acting as a valid one'
    assert @department.errors[:name].present?, 'invalid name name with insecure characters with no defined error'
  end
  # Methods
  def department_column_class(column)
    Department.columns.detect { |each| each.name == column.to_s }
  end
end
