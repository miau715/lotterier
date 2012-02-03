class ParticipantsController < ApplicationController
  
  def index
    @event = Event.find(params[:event_id])
    
    redirect_to event_path(@event)
  end
  
  def show
    @event = Event.find(params[:event_id])
    @participant = @event.participants.find(params[:id])
  end
  
  def new
    @event = Event.find(params[:event_id])
    @participant = @event.participants.build
  end
  
  def create
    @event = Event.find(params[:event_id])
    @participant = @event.participants.build(params[:participant])
    @participant.save
    
    redirect_to event_participant_path(@event, @participant)
  end
  
  def edit
    @event = Event.find(params[:event_id])
    @participant = @event.participants.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:event_id])
    @participant = @event.participants.find(params[:id])
    @participant.update_attributes(params[:participant])
    
    redirect_to event_participant_path(@event, @participant)
  end
  
  def destroy
    @event = Event.find(params[:event_id])
    @participant = @event.participants.find(params[:id])
    @participant.destroy
    
    redirect_to event_participants_path(@event, @participant)
  end
  
end
