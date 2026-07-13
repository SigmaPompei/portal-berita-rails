Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'pages#index'
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
  resources :categories, only: [:index, :show]

  namespace :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    resources :articles, only: [:index, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end