Rails.application.routes.draw do
  get 'flats/new'
  get 'flats/create'
  devise_for :users
    resources :flats do
      resources :bookings, only: [:new, :create]
    end
  resources :bookings, only: [:index, :show, :destroy, :update] do
    collection do
      get 'host'
      get 'guest'
    end
  end
  root to: 'pages#home'
end
