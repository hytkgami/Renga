Rails.application.routes.draw do
  post 'messages/create'

  get 'sessions/destroy'

  get 'sessions/create'

  get 'sessions/destory'

  resources :sessions, only: [:create]
  resources :messages, only: [:index, :create]

  root to: 'sessions#index'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
