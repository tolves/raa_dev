Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'index#index'
  resources :users
  resources :products
  resources :admins

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#logout'
  get 'permission_restriction', to: 'users#permission_restriction'

  get 'admin_login', to: 'admins#login'
  post 'admin_login', to: 'admins#login_auth'
  post 'admin_logout', to: 'admins#logout'
end
