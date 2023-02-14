Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'user/registrations'}
  resources :activities do
    collection do
      get 'stats'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/dark_mode', to: 'application#dark_mode', as: 'dark_mode'
  get '/light_mode', to: 'application#light_mode', as: 'light_mode'
  root 'activities#index'
  get '/static_pages/home', to: 'static_pages#home'
end
