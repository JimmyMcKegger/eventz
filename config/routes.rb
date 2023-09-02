# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'

  resources :events do
    resources :registrations
    resources :likes
  end

  # singular
  resource :session, only: %i[new create destroy]

  resources :users
  get 'signup' => 'users#new'
end
