Rails.application.routes.draw do
  devise_for :users,
    path: 'users',
    path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'confirmation', unlock: 'unlock', registration: 'register', sign_up: 'signup' },
    controllers: { registrations: 'registrations'}
  resources :users, except: [:new] do
    resources :dungles
  end
  root 'welcome#index'
end
