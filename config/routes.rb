# frozen_string_literal: true

Rails.application.routes.draw do

  root "events#index"

  get 'events' => 'events#index'
  get 'events/:id' => 'events#show', as: "event" # this sets an event_path for the link_to() helper method
  get 'events/:id/edit' => 'events#edit', as: "edit_event"
  patch 'events/:id' => "events#update"
end
