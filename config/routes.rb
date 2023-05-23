Rails.application.routes.draw do
  #devise_for :user_logins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :user_logins, controllers: {
    registrations: 'user_logins/registrations'
  }

  # UsersController
  get '/users/show', to: 'users#show'
  get '/users/edit', to: 'users#editPage'
  post '/users/edit', to: 'users#edit'
  delete '/users/delete', to: 'users#delete'

  # AdvertisementsController
  get '/advertisements', to: 'advertisements#allAdvertisements'
  get '/advertisements/show', to: 'advertisements#show'
  get '/advertisements/new', to: 'advertisements#createPage'
  post '/advertisements/new', to: 'advertisements#create'
  get '/advertisements/edit', to: 'advertisements#editPage'
  post '/advertisements/edit', to: 'advertisements#edit'
  delete '/advertisements/delete', to: 'advertisements#delete'

  # StatusesController
  get '/statuses', to: 'statuses#allStatuses'
  get '/statuses/new', to: 'statuses#createPage'
  post '/statuses/new', to: 'statuses#create'
  get '/statuses/edit', to: 'statuses#editPage'
  post '/statuses/edit', to: 'statuses#edit'
  delete '/statuses/delete', to: 'statuses#delete'


  # CitiesController
  get '/cities', to: 'cities#allCities'
  get '/cities/new', to: 'cities#createPage'
  post '/cities/new', to: 'cities#create'
  get '/cities/edit', to: 'cities#editPage'
  post '/cities/edit', to: 'cities#edit'
  delete '/cities/delete', to: 'cities#delete'


  # ColorsController
  get '/colors', to: 'colors#allColors'
  get '/colors/new', to: 'colors#createPage'
  post '/colors/new', to: 'colors#create'
  get '/colors/edit', to: 'colors#editPage'
  post '/colors/edit', to: 'colors#edit'
  delete '/colors/delete', to: 'colors#delete'

  # MarkasController
  get '/markas', to: 'markas#allMarkas'
  get '/markas/new', to: 'markas#createPage'
  post '/markas/new', to: 'markas#create'
  get '/markas/edit', to: 'markas#editPage'
  post '/markas/edit', to: 'markas#edit'
  delete '/markas/delete', to: 'markas#delete'


  # ModelsController
  get '/models', to: 'models#allModels'
  get '/models/new', to: 'models#createPage'
  post '/models/new', to: 'models#create'
  get '/models/edit', to: 'models#editPage'
  post '/models/edit', to: 'models#edit'
  delete '/models/delete', to: 'models#delete'

  # CountriesController
  get '/countries', to: 'countries#allCountries'
  get '/countries/new', to: 'countries#createPage'
  post '/countries/new', to: 'countries#create'
  get '/countries/edit', to: 'countries#editPage'
  post '/countries/edit', to: 'countries#edit'
  delete '/countries/delete', to: 'countries#delete'

  # TypeAutosController
  get '/type_autos', to: 'type_autos#allTypeAutos'
  get '/type_autos/new', to: 'type_autos#createPage'
  post '/type_autos/new', to: 'type_autos#create'
  get '/type_autos/edit', to: 'type_autos#editPage'
  post '/type_autos/edit', to: 'type_autos#edit'
  delete '/type_autos/delete', to: 'type_autos#delete'

  # TypeDriveAutosController
  get '/type_drive_autos', to: 'type_drive_autos#allTypeDriveAutos'
  get '/type_drive_autos/new', to: 'type_drive_autos#createPage'
  post '/type_drive_autos/new', to: 'type_drive_autos#create'
  get '/type_drive_autos/edit', to: 'type_drive_autos#editPage'
  post '/type_drive_autos/edit', to: 'type_drive_autos#edit'
  delete '/type_drive_autos/delete', to: 'type_drive_autos#delete'

  # TypeFuelsController
  get '/type_fuels', to: 'type_fuels#allTypeFuels'
  get '/type_fuels/new', to: 'type_fuels#createPage'
  post '/type_fuels/new', to: 'type_fuels#create'
  get '/type_fuels/edit', to: 'type_fuels#editPage'
  post '/type_fuels/edit', to: 'type_fuels#edit'
  delete '/type_fuels/delete', to: 'type_fuels#delete'

  # TypeKuzovsController
  get '/type_kuzovs', to: 'type_kuzovs#allTypeKuzovs'
  get '/type_kuzovs/new', to: 'type_kuzovs#createPage'
  post '/type_kuzovs/new', to: 'type_kuzovs#create'
  get '/type_kuzovs/edit', to: 'type_kuzovs#editPage'
  post '/type_kuzovs/edit', to: 'type_kuzovs#edit'
  delete '/type_kuzovs/delete', to: 'type_kuzovs#delete'


  # TypeTransmissionsController
  get '/type_transmissions', to: 'type_transmissions#allTypeTransmissions'
  get '/type_transmissions/new', to: 'type_transmissions#createPage'
  post '/type_transmissions/new', to: 'type_transmissions#create'
  get '/type_transmissions/edit', to: 'type_transmissions#editPage'
  post '/type_transmissions/edit', to: 'type_transmissions#edit'
  delete '/type_transmissions/delete', to: 'type_transmissions#delete'

  # ValutesController
  get '/valutes', to: 'valutes#allValutes'
  get '/valutes/new', to: 'valutes#createPage'
  post '/valutes/new', to: 'valutes#create'
  get '/valutes/edit', to: 'valutes#editPage'
  post '/valutes/edit', to: 'valutes#edit'
  delete '/valutes/delete', to: 'valutes#delete'

  get '/', to: 'pages#my_page'
end
