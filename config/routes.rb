Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'index#index'
  resources :users
  # resources :products
  namespace :admin do
    resources :products
    resources :brands
    resources :categories
  end

  post 'admin/products/:id', to: 'admin/products#create'

  get 'admin', to: 'admin#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#logout'
  get 'permission_restriction', to: 'users#permission_restriction'

  get 'admin_login', to: 'admin#login'
  post 'admin_login', to: 'admin#login_auth'
  post 'admin_logout', to: 'admin#logout'
end
