Rails.application.routes.draw do
  resources :activities
  get "/", to: "activities#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/stats", to: "activities#stats"
end
