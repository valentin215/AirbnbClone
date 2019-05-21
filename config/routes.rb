Rails.application.routes.draw do
  get 'flats/new'
  get 'flats/create'
  devise_for :users
  resources :flats
  root to: 'pages#home'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
