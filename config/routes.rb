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
  get '/typeautos', to: 'TypeAutos#allTypeAutos'
  get '/typeautos/new', to: 'TypeAutos#createPage'
  post '/typeautos/new', to: 'TypeAutos#create'
  get '/typeautos/edit', to: 'TypeAutos#editPage'
  post '/typeautos/edit', to: 'TypeAutos#edit'
  delete '/typeautos/delete', to: 'TypeAutos#delete'

  # TypeDriveAutosController
  get '/typedriveauto', to: 'TypeDriveAutos#allTypeDriveAutos'
  get '/typedriveauto/new', to: 'TypeDriveAutos#createPage'
  post '/typedriveauto/new', to: 'TypeDriveAutos#create'
  get '/typedriveauto/edit', to: 'TypeDriveAutos#editPage'
  post '/typedriveauto/edit', to: 'TypeDriveAutos#edit'
  delete '/typedriveauto/delete', to: 'TypeDriveAutos#delete'

  # TypeFuelsController
  get '/typefuels', to: 'TypeFuels#allTypeFuels'
  get '/typefuels/new', to: 'TypeFuels#createPage'
  post '/typefuels/new', to: 'TypeFuels#create'
  get '/typefuels/edit', to: 'TypeFuels#editPage'
  post '/typefuels/edit', to: 'TypeFuels#edit'
  delete '/typefuels/delete', to: 'TypeFuels#delete'

  # TypeKuzovsController
  get '/typekuzovs', to: 'TypeKuzovs#allTypeKuzovs'
  get '/typekuzovs/new', to: 'TypeKuzovs#createPage'
  post '/typekuzovs/new', to: 'TypeKuzovs#create'
  get '/typekuzovs/edit', to: 'TypeKuzovs#editPage'
  post '/typekuzovs/edit', to: 'TypeKuzovs#edit'
  delete '/typekuzovs/delete', to: 'TypeKuzovs#delete'


  # TypeTransmissionsController
  get '/typetransmissions', to: 'TypeTransmissions#allTypeTransmissions'
  get '/typetransmissions/new', to: 'TypeTransmissions#createPage'
  post '/typetransmissions/new', to: 'TypeTransmissions#create'
  get '/typetransmissions/edit', to: 'TypeTransmissions#editPage'
  post '/typetransmissions/edit', to: 'TypeTransmissions#edit'
  delete '/typetransmissions/delete', to: 'TypeTransmissions#delete'

  # ValutesController
  get '/valutes', to: 'Valutes#allValutes'
  get '/valutes/new', to: 'Valutes#createPage'
  post '/valutes/new', to: 'Valutes#create'
  get '/valutes/edit', to: 'Valutes#editPage'
  post '/valutes/edit', to: 'Valutes#edit'
  delete '/valutes/delete', to: 'Valutes#delete'

  get '/', to: 'pages#my_page'
end
