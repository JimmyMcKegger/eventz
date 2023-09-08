# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :require_signin, except: %i[index show]
  before_action :require_admin, except: %i[index show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    case params[:filter]
    when "past"
      @events = Event.past
    when "free"
      @events = Event.free
    when "recent"
      @events = Event.recent
    else
      @events = Event.upcoming
    end

    puts @events.inspect

  end

  def show
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

  end

  def update
    logger.info("Updating #{@event.name}")
    if @event.update(event_params)
      flash[:notice] = 'Event successfully updated!'
      redirect_to event_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, status: :see_other, notice: 'Event successfully deleted!'
  end

  private

  def set_event
    @event = Event.find_by!(slug: params[:id])
  end

  def event_params
    params.require(:event)
          .permit(:name, :description, :location, :price, :starts_at, :capacity, :image_file_name, category_ids: [])
  end
end
