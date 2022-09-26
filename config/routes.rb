# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :departments, :employees, :games, only: %i[index show create]
    end
  end
end
