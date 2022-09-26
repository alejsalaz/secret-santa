# frozen_string_literal: true

module EmployeeAsserts
  def employee_response_asserts
    employee = Employee.find(response_data['id'])
    assert_equal create_employee_valid_keys, response_data.keys, 'matching valid keys'
    assert_equal employee.id, response_data['id'], 'matching id'
    assert_equal employee.name, response_data['name'], 'matching name'
    assert_equal employee.department.name, response_data['department'], 'matching department name'
    assert_equal employee.created_at.year, response_data['year'], 'matching year'
  end
end
