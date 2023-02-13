Rails.application.routes.draw do
  devise_for :users
  resources :activities do
    collection do
      get 'stats', to: 'stats#index'
    end
  end
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
