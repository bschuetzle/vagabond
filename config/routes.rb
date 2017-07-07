Rails.application.routes.draw do

  root  "homepage#index"
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    resources :posts, only: :show
  end

  resources :locations do
    resources :posts
  end

  resources :posts, only: :show

end
