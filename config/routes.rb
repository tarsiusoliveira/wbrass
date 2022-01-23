Rails.application.routes.draw do
  resources :sources
  root 'projects#index', as: 'projects_index'
  resources :projects
  resources :positions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'

  Rails.application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
  end
end
