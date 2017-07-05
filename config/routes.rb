Rails.application.routes.draw do

  root  "site#index"
  resources :users

end
