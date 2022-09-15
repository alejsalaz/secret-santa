# frozen_string_literal: true

json.error do
  json.message @employee.errors.full_messages
  json.object @employee.class.name
end
