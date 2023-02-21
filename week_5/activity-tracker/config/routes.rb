Rails.application.routes.draw do
  devise_for :users
  resources :activities
  root 'static_pages#index'
  get 'static_pages/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "activities#index"
  get "/activities/stats", to: "activities#stats"
end
