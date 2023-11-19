Rails.application.routes.draw do
  # API routing
  scope module: 'api', defaults: {format: 'json'} do
    namespace :v1 do
      # provide the routes for the API here
      get 'investigations', to: 'investigations#index', as: :investigations 
    end
  end

  # Routes for regular HTML views go here...
  # Semi-static page routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy

  # Authentication routes
  resources :sessions
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout

  # Resource routes (maps HTTP verbs to controller actions automatically):
  resources :officers
  resources :investigations
  resources :units
  resources :crimes

  # Routes for assignments
  get 'assignments/new', to: 'assignments#new', as: :new_assignment
  post 'assignments', to: 'assignments#create', as: :assignments
  patch 'assignments/:id/terminate', to: 'assignments#terminate', as: :terminate_assignment

  # Routes for crime_investigations
  get 'crime_investigations/new', to: 'crime_investigations#new', as: :new_crime_investigation
  post 'crime_investigations', to: 'crime_investigations#create', as: :crime_investigations
  delete 'crime_investigations/:id', to: 'crime_investigations#destroy', as: :remove_crimes

  # Routes for investigation_notes
  get 'investigation_notes/new', to: 'investigation_notes#new', as: :new_investigation_note
  post 'investigation_notes', to: 'investigation_notes#create', as: :investigation_notes
  
  # Toggle paths
  # get 'units/:id/toggle', to: 'units#toggle', as: :toggle_unit
  # get 'crimes/:id/toggle', to: 'crimes#toggle', as: :toggle_crime
  # get 'officers/:id/toggle', to: 'officers#toggle', as: :toggle_officer

  # Other custom routes
  patch 'investigations/:id/close', to: 'investigations#close', as: :close_investigation
  # get 'investigations/:id/crime_investigations', to: 'investigations#crimes', as: :investigation_crimes

  # Routes for searching
  # get 'investigation_search', to: 'investigations#search', as: :investigation_search
  # get 'officer_search', to: 'officers#search', as: :officer_search

  # You can have the root of your site routed with 'root'
  root 'home#index'
end
