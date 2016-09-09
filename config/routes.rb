Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :issues, only: [:index, :create]
      resources :states, only: :index
      resources :issue_reasons, only: :index
      resources :issue_types, only: :index
      resources :customers, only: [:index, :create]
    end
  end

end
