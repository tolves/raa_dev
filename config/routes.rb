Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  resources :users
  resources :products
  namespace :admin do
    resources :products
    resources :brands
    resources :categories
  end

  # post 'admin/products/:id', to: 'admin/products#create'

  get 'admin', to: 'admin#index'

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#logout'
  get 'permission_restriction', to: 'sessions#permission_restriction'

  get 'admin/login', to: 'admin#login'
  post 'admin/login', to: 'admin#login_auth'
  post 'admin/logout', to: 'admin#logout'
end
