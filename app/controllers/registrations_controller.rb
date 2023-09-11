# frozen_string_literal: true

class RegistrationsController < ApplicationController
  before_action :require_signin
  before_action :set_event

  def index
    @registrations = @event.registrations.all
  end

  def new
    @registration = @event.registrations.new
    p @event
  end

  def create
    @registration = @event.registrations.new(registration_params)
    @registration.user = current_user
    begin
      if @registration.save
        redirect_to event_registrations_url(@event),
                    notice: 'Thanks for registering'
      else
        render :new, status: :unprocessable_entity
      end
    rescue => exception
      p exception
    end
  end

  def show
    @registration = @event.registrations.find(params[:id])
  end

  def destroy
    @registration = @event.registrations.find(params[:id])
    @registration.destroy

    redirect_to events_url, status: :see_other, notice: 'Registration successfully deleted!'
  end

  private

  def set_event
    @event = Event.find_by!(slug: params[:event_id])
  end

  def registration_params
    params.require(:registration).permit(:how_heard)
  end
end
