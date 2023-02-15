Rails.application.routes.draw do
  devise_for :users
  root "static_pages#index"
  get "about", to: "static_pages#about"
  resources :activities do
    collection do
      get 'stats'
    end
  end
end
