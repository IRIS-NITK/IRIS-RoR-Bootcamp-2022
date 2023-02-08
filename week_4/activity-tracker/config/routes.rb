Rails.application.routes.draw do
  devise_for :users
  root "static_pages#index"
  get "about", to: "static_pages#about"
  resources :activities do
    collection do
      get 'stats'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
