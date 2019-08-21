Rails.application.routes.draw do
  devise_for :users
  root to: 'application#home'
  get '/home', to: 'application#home' 
  get '/ranking', to: 'application#ranking', as: 'ranking'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
