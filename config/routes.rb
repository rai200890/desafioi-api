Rails.application.routes.draw do

  resources :issues, only: [:index, :create]
  resources :states, only: :index
  resources :issue_reasons, only: :index
  resources :issue_types, only: :index

end
