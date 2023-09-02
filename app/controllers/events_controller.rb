# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :require_signin, except: %i[index show]
  before_action :require_admin, except: %i[index show]

  def index
    @events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
    @likes = @event.followers

    @categories = @event.categories

    return unless current_user

    @like = current_user.likes.find_by(event_id: @event.id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event), notice: 'Event successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    logger.info("Updating #{@event.name}")
    if @event.update(event_params)
      flash[:notice] = 'Event successfully updated!'
      redirect_to event_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_url, status: :see_other, notice: 'Event successfully deleted!'
  end

  private

  def event_params
    params.require(:event)
          .permit(:name, :description, :location, :price, :starts_at, :capacity, :image_file_name)
  end
end
