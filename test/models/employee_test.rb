# frozen_string_literal: true

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  setup do
    @department = departments(:department_one)
    @employee = employees(:employee_one)
  end
  # Columns
  test 'has a valid column named name' do
    assert Employee.column_names.include?('name'), 'name column is included'
    assert_equal 'string', employee_column_class('name').type.to_s, 'name column is a string'
    assert_not employee_column_class('name').null, 'name column is not null'
  end

  test 'has a valid column named department_id' do
    assert Employee.column_names.include?('department_id'), 'department_id column is included'
    assert_equal 'integer', employee_column_class('department_id').type.to_s, 'department_id column is an integer'
    assert_not employee_column_class('department_id').null, 'department_id column is not null'
  end
  # Relations
  test 'is related with department' do
    assert_equal @employee.department, @department
  end
  # Validations
  test 'cannot have a nil name' do
    @employee.name = nil

    refute @employee.valid?, 'invalid nil name acting as a valid one'
    assert @employee.errors[:name].present?, 'invalid nil name with no defined error'
    assert @employee.errors.details[:name][0][:code].present?, 'invalid name with no code error'
  end

  test 'cannot have a name less than three characters long' do
    @employee.name = 'foo'

    refute @employee.valid?, 'invalid three characters long name acting as a valid one'
    assert @employee.errors[:name].present?, 'invalid three characters long name with no defined error'
    assert @employee.errors.details[:name][0][:code].present?, 'invalid name with no code error'
  end

  test 'cannot have a name with insecure characters' do
    invalid_employee = Employee.create(name: '@@@@', department_id: @department.id)

    refute invalid_employee.valid?, 'invalid name name with insecure characters acting as a valid one'
    assert invalid_employee.errors[:name].present?, 'invalid name name with insecure characters with no defined error'
    assert invalid_employee.errors.details[:name][0][:code].present?, 'invalid name with no code error'
  end

  test 'cannot have a nil department_id' do
    @employee.department_id = nil

    refute @employee.valid?, 'invalid nil department_id acting as a valid one'
    assert @employee.errors[:department_id].present?, 'invalid nil department_id with no defined error'
    assert @employee.errors.details[:department_id][0][:code].present?, 'invalid name with no code error'
  end

  test 'department_id must reference an existing Department' do
    @employee.department_id = @department.id - 1

    refute @employee.valid?, 'invalid department acting as a valid one'
    assert @employee.errors[:department].present?, 'invalid department with no defined error'
  end
  # Methods
  def employee_column_class(column)
    Employee.columns.detect { |each| each.name == column.to_s }
  end
end
