Rails.application.routes.draw do
  get 'activities/stat'
  get 'activities/anish'
  get 'statistics/stats'
  devise_for :users
  resources :activities
  get '/activities/stats', to: 'activities#stats'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
  root to: "devise/sessions#new"
  end
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
