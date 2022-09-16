# frozen_string_literal: true

json.data @departments do |department|
  json.id department.id
  json.name department.name
  json.employees department.employees.count
end
