Rails.application.routes.draw do
  get 'static_pages/index'
  get 'static_pages/about'
  get 'about',to:"static_pages#about"
  get 'generate_pdf', to: 'activities#generate_pdf', as: 'generate_pdf_user'
  devise_for :users
  resources :activities do
    collection do
      get 'stats'
    end
  end

  root 'static_pages#index'

end
