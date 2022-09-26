# frozen_string_literal: true

module DepartmentAsserts
  def department_response_asserts
    department = Department.find(response_data['id'])
    assert_equal create_department_valid_keys, response_data.keys, 'matching valid keys'
    assert_equal department.id, response_data['id'], 'matching id'
    assert_equal department.name, response_data['name'], 'matching name'
  end
end
