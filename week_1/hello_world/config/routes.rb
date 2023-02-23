Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/', to: 'page#root'
  get 'about_me', to: 'page#about_me'
  # Defines the root path route ("/")
  # root "articles#index"
end
