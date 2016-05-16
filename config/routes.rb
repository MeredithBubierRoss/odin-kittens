Rails.application.routes.draw do
  root 'kittens#index'
  resources :kittens

  namespace :api do
    namespace :v1 do
      resources :kittens, only: [:index]
    end
  end
end
