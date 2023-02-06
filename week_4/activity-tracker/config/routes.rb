Rails.application.routes.draw do
  resources :activities do
    collection do
      get 'stats'
    end
  end

  root 'static_pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
