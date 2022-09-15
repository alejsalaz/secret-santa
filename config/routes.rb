Rails.application.routes.draw do
  namespace :api, default: { format: 'json' } do
    namespace :v1 do
      resources :departments, :employees, only: %i[index create]
    end
  end
end
