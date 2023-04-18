# frozen_string_literal: true

Rails.application.routes.draw do
  get 'events' => 'events#index'
  get 'events/:id' => 'events#show'
end
