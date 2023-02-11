Rails.application.routes.draw do
  devise_for :users
  resources :activities
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "activities#index"

  get '/stats', to: 'activities#stats'
end
