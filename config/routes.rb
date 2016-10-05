Rails.application.routes.draw do

  use_doorkeeper do
    controllers :tokens => 'custom_tokens'
  end

  devise_for :users, :only => []

  match '*all', :to => 'base#preflight', :via => [:options]

  root 'application#index'

  resources :users, :only => [:index, :show, :create] do
    member do
      post :set_preferred_point
      get :addresses
      get :preferred_points
    end
  end

  resources :points, :only => [:index, :show, :create]

  resources :routes, :only => [:index, :show, :create]

  resources :bookings, :only => [:index, :show, :create]

  resources :addresses, :only => [:index, :show, :create]

  get '/user_bookings', :to => 'bookings#user_bookings', :as => :user_bookings

  post '/login', :to => 'sessions#create', :as => :login

  delete '/logout', :to => 'sessions#destroy', :as => :logout

end
