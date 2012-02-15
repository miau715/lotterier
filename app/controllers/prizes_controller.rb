class PrizesController < ApplicationController
  

  def index
    @event = Event.find(params[:event_id])
    redirect_to event_path(@event)
  end
  
  def show
    @event = Event.find(params[:event_id])
    @prize = @event.prizes.find(params[:id])
  end
  
  def new
    @event = Event.find(params[:event_id])
    @prize = @event.prizes.build
  end
  
  def create
    @event = Event.find(params[:event_id])
    @prize = @event.prizes.build(params[:prize])
    @prize.save
    
    redirect_to event_prize_path(@event, @prize)
  end
  
  def edit
    @event = Event.find(params[:event_id])
    @prize = @event.prizes.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:event_id])
    @prize = @event.prizes.find(params[:id])
    @prize.update_attributes(params[:prize])
    
    redirect_to event_prize_path(@event, @prize)
  end
  
  def destroy
    @event = Event.find(params[:event_id])
    @prize = @event.prize.find(params[:id])
    @prize.destroy
    
    redirect_to event_prizes_url(@event, @prize)
  end
  
  
end
