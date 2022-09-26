# frozen_string_literal: true

module DepartmentsSupport
  def department_params
    {
      "department": {
        "name": 'success'
      }
    }
  end

  def invalid_department_params
    {
      "department": {
        "name": '@@@@'
      }
    }
  end

  def create_department_valid_keys
    %w[id name]
  end
end
