Rails.application.routes.draw do
  devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'confirmation', unlock: 'unlock', registration: 'register', sign_up: 'signup' }
  resources :users, except: [:new] do
    resources :dungles do
      resources :location, except: [:index, :show]
    end
  end
  root 'welcome#index'
end
