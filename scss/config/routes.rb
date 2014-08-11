Rails.application.routes.draw do
  root to: 'letters#new'

  get '/about', to: 'static_pages#about'

  resources :letters
end
