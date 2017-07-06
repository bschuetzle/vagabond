Rails.application.routes.draw do

  root  "homepage#index"
  resources :users, :locations

end
