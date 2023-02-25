Rails.application.routes.draw do
  devise_for :users
  resources :activities
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "static_pages#index"
  get "activities/stats", to: "activities#stats", as: "stats_activities"
end
