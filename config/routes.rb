Rails.application.routes.draw do
  devise_for :users
  root to: 'core#home'
  get '/home', to: 'core#home' 
  get '/ranking', to: 'core#ranking', as: 'ranking'
  get '/detail/:id', to: 'core#details', as: 'detail'

  resources :like, only: [:create, :destroy] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
