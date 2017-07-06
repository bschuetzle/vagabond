Rails.application.routes.draw do

  root  "homepage#index"
  resources :users

end
