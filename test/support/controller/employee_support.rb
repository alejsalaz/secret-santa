# frozen_string_literal: true

module EmployeesSupport
  def employee_params
    {
      "employee": {
        "name": 'juan',
        "department_id": departments(:department_one).id
      }
    }
  end

  def invalid_employee_params
    {
      "employee": {
        "name": '@@@@'
      }
    }
  end

  def create_employee_valid_keys
    %w[id name department year]
  end
end
