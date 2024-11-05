# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  delete '/auth/google_oauth2/logout', to: 'users/omniauth_callbacks#google_logout', as: :google_logout

  resources :bookmarks

  root 'bookmarks#index'
end
