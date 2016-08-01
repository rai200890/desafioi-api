Rails.application.routes.draw do

  jsonapi_resources :issues, only: :index
  jsonapi_resources :states, only: :index

end
