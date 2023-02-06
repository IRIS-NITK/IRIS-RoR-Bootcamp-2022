Rails.application.routes.draw do
  get 'page/root'
  get 'page/about_me'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
    get '/', to: 'page#root'
    get 'about_me', to: 'page#about_me'
  # root "articles#index"
end
