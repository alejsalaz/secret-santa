# frozen_string_literal: true

json.error do
  json.message @employee.errors.full_messages

  if @employee.errors.details[:name][0].nil?
    json.code @employee.errors.details[:department_id][0][:code]
  else
    json.code @employee.errors.details[:name][0][:code]
  end

  json.object @employee.class.name
end
