Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:new]
  root 'welcome#index'
end
