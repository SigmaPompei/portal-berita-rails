Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :articles
  resources :categories, only: [:index, :show]

  namespace :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    resources :articles, only: [:index, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end