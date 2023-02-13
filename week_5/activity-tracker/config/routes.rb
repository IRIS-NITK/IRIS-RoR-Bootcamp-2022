Rails.application.routes.draw do
  get 'static_pages/index'
  get 'static_pages/about'
  get 'about',to:"static_pages#about"

  devise_for :users
  resources :activities do
    collection do
      get 'stats'
    end
  end

  root 'static_pages#index'
 


end
