class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new 
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    @event.save
    
    redirect_to events_path
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    
    redirect_to event_path(@event)
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    
    redirect_to events_path
  end
  
end
