Rails.application.routes.draw do
  resources :reports
  resources :materials
  resources :plans
  resources :receivers
  resources :sources
  root 'projects#index', as: 'projects_index'
  resources :projects
  resources :positions
  get 'download' => 'projects#download'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'

  Rails.application.routes.draw do
  resources :reports
  resources :materials
  resources :plans
  resources :receivers
  get 'download' => 'projects#download'
    mount Sidekiq::Web => '/sidekiq'
  end
end
