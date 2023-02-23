Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root "static_pages#index"
  get "about", to: "static_pages#about"
  resources :activities do
    collection do
      get 'stats'
    end
  end
end
