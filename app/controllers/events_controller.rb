# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @age = rand(100)
    @events = ['BugSmash', 'Hackathon', 'Kata Camp', 'Rails User Group']
  end
end
