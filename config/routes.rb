# frozen_string_literal: true

Rails.application.routes.draw do
  resources :games
  namespace :api, default: { format: 'json' } do
    namespace :v1 do
      resources :departments, :employees, :games, only: %i[index create]
    end
  end
end
