Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/failure', to: redirect('/')
  get 'home', to: 'home#index'
  get 'me', to: 'me#show', as: 'me'

end
