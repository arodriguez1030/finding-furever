Rails.application.routes.draw do
  get '/' => 'sessions#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  #get "/admin_login", to: 'sessions#admin_new'
  #post "/admin_login", to: 'sessions#admin_new'
  resources :admins
  resources :applications
  resources :pets
  resources :shelters
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
