Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  resources :pages, only: [:show, :edit, :update] do
    collection do
      get 'generate_weekly'
    end
  end
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
