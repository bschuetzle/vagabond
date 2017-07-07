Rails.application.routes.draw do

  root  "homepage#index"
  resources :sessions

  resources :users do
    resources :posts, only: :show
  end

  resources :locations do
    resources :posts
  end

  resources :posts, only: :show

end
