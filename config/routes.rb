Rails.application.routes.draw do
  root 'sessions#new'
  post 'welcome', to: 'welcome#create'
  get 'welcome/contact'
  get 'welcome/team'
  resources :sessions, only: [:new, :create, :destroy]
  resources :cities
  resources :users
  resources :gossips do
    resources :comments
  end
end
