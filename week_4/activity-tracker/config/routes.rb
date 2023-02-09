Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  get 'static_pages/index'
  # get '/static_pages/index', to: 'static_pages#index'
  get '/static_pages/about', to: 'static_pages#about'
  resources :activities
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "activities#index"
  get "/activities/stats", to: "activities#stats", as: "activity_stats"
end
