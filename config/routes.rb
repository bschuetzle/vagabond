Rails.application.routes.draw do

  root  "homepage#index"

  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup' => 'users#new'
  resources :users, only: [:new]

  resources :users do
    resources :posts, only: :show
  end

  resources :locations do
    resources :posts
  end

end
