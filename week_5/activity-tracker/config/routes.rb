Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  get "activities/pdf" , to: "activities#pdf"
  root "static_pages#index"
  get "about", to: "static_pages#about"
  resources :activities do
    collection do
      get 'stats'
    end
  end
end
