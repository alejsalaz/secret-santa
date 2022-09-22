# frozen_string_literal: true

json.data @employees do |employee|
  json.id employee.id
  json.name employee.name
  json.department employee.department.name
  json.year employee.created_at.year
end
