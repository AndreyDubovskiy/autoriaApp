Rails.application.routes.draw do
  #devise_for :user_logins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  # StatusesController
  get '/statuses', to: 'statuses#allStatuses'
  get '/statuses/new', to: 'statuses#createPage'
  post '/statuses/new', to: 'statuses#create'
  get '/statuses/edit', to: 'statuses#editPage'
  post '/statuses/edit', to: 'statuses#edit'
  delete '/statuses/delete', to: 'statuses#delete'


  #
  get '/', to: 'pages#my_page'
end
