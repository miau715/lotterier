class Admin::EventsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  before_filter :require_is_admin
  
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
    @participants = @event.participants
  end
  
  def new 
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    @event.user_id = current_user.id
    
    @event.save
    
    redirect_to admin_event_path(@event)
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    
    redirect_to admin_event_path(@event)
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    
    redirect_to admin_events_url
  end
  
end
