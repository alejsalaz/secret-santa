# frozen_string_literal: true

json.error do
  json.message @department.errors.full_messages
  json.object @department.class.name
end
