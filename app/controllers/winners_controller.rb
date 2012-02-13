class WinnersController < ApplicationController
  def index
    # @event = Event.find(params[:event_id])
    # @winners = @event.participants.order('random()').limit(params[:quantity])
    @event = Event.find(params[:event_id])
    @prizes = @event.prizes
    @winners = []

    @participants = @event.participants.order('random()').limit(3)
    @event.prizes.each_with_index do |prize, s|
      prize.quantity.times do |i|
        @winner = @participants[i+s].winners.build(:prize_id => prize.id, :event_id => @event.id)
        @winner.save
        @winners << @winner
      end
    end
  end
  

end
