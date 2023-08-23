# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'

  resources :events do
    resources :registrations
  end

  # singular
  resource :session, only: [:new, :create, :destroy]

  resources :users
  get 'signup' => 'users#new'
end
