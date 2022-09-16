# frozen_string_literal: true

json.error do
  json.message @department.errors.full_messages
  json.code @department.errors.details[:name][0][:code]
  json.object @department.class.name
end
