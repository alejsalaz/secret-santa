# frozen_string_literal: true

json.error do
  json.message @game.errors.full_messages

  if @game.errors.details[:year][0].nil?
    json.code @game.errors.details[:couples][0][:code]
  else
    json.code @game.errors.details[:year][0][:code]
  end

  json.object @game.class.name
end
