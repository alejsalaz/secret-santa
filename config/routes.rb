Rails.application.routes.draw do
  resources :employees, only: %i[index create]
  resources :departments, only: %i[index create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
