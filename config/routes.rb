Rails.application.routes.draw do
  get 'flats/new'
  get 'flats/create'
  devise_for :users
  resources :flats
  root to: 'pages#home'
end
