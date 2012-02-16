class EventsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @events = current_user.events.all
  end
  
  def show
    @event = current_user.events.find(params[:id])
    @participants = @event.participants
    @prizes = @event.prizes
  end
  
  def new 
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    @event.user_id = current_user.id
    
    @event.save
    
    redirect_to events_path
  end
  
  def edit
    @event = current_user.events.find(params[:id])
  end
  
  def update
    @event = current_user.events.find(params[:id])
    @event.update_attributes(params[:event])
    
    redirect_to event_path(@event)
  end
  
  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    
    redirect_to events_path
  end
  
  def lottery
    # @event = Event.find(params[:event_id])
    # @name = params[:name]
    # @quantity = params[:quantity]
    # redirect_to event_winners_path(@event, { :name => @name, :quantity => @quantity })
    
    @event = Event.find(params[:event_id])
    @prizes = @event.prizes
    @participants = @event.participants.order('random()')
    
    @prizes.each_with_index do |prize, i|
      prize.quantity.times do |j|
        @winner = @participants[i+j].update_attributes(:prize_id => prize.id)
      end
    end
    
    @winners = @event.participants.find(:all, :joins => :prize, :conditions => "prize_id IS NOT NULL" ) 
    
    # redirect_to event_winners_path(@event)

  end
end
