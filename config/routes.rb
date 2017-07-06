Rails.application.routes.draw do

  root  "homepage#index"
  resources :sessions

  resources :users do
    resources :posts
   end

  resources :locations do
    resources :posts
  end

end
