class WinnersController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @winners = @event.participants.order('random()')
    
  end
  
  

  
  
end
