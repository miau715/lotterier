class WinnersController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @winners = @event.participants.order('random()').limit(params[:quantity])
    
  end
  
  

  
  
end
