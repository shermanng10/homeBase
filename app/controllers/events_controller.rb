class EventsController < ApplicationController
  before_action :require_login
  
  def index
    @events = Event.where(family_id: session[:user_id ])
  end

  def create
    @event= Event.new(event_params)
    @event.family = current_user
    if @event.save
      flash[:message] = "Your event has been saved"
    else
      flash[:error] = "Please enter a valid event"
    end
    redirect_to :back
  end

  private
  def event_params
    params.require(:event).permit :title, :start_time, :end_time, :family_id, :member_id
  end
end
