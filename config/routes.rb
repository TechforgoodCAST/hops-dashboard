# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: [:registrations] , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  # Core application routes
  resources :design_hops
  resources :networks
  resources :regions
  
  get 'map', to: 'design_hops#map'
  
  get 'airtable', to: 'statics#airtable'

  # Statics

  get 'privacy', to: 'statics#privacy'
  get 'terms', to: 'statics#terms'
  get 'home', to: 'statics#home'

  # Root

  authenticated :user do
    root 'regions#index', as: :authenticated_root
  end

  root to: 'statics#home'
end
