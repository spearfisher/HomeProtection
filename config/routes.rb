Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions
  resources :raspberries, path: 'settings' do
    get 'test', on: :member
  end
  resources :users, only: [:show, :update]
  get '/auth/:provider/callback', to: 'sessions#create'
end
