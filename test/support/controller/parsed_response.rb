# frozen_string_literal: true

module ParsedResponse
  def response_body
    JSON.parse(@response.body)
  end

  def response_data
    response_body['data']
  end
end
