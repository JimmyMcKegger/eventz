# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    unless @event.errors.any? 
      redirect_to event_path(@event)
    else

    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    logger.info("Updating #{@event.name}")
    @event.update(event_params)

    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_url, status: :see_other
  end

  private

  def event_params
    params.require(:event)
          .permit(:name, :description, :location, :price, :starts_at, :capacity, :image_file_name)
  end
end
