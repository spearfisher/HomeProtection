Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions
  resources :raspberries, path: 'settings' do
    get 'test', on: :member
  end
  resource :climate_sensors, only: [:create, :update, :destroy]
  resources :users, only: [:show, :update] do
    get :climate_range, on: :member
  end
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/api/climate_logs/:id', to: 'climate_logs#create'
end
