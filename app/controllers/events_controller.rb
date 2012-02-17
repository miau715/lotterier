# encoding: utf-8
class EventsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @events = current_user.events.all
  end
  
  def show
    @event = current_user.events.find(params[:id])
    @participants = @event.participants
    @prizes = @event.prizes
    @prizes_size = @prizes.sum(:quantity)
  end
  
  def new 
    @event = current_user.events.build
  end
  
  def create
    @event = current_user.events.build(params[:event])
    if @event.save
      redirect_to events_path, :notice => "已建立新活動 #{@event.name}"
    else
      redirect_to events_path, :error => "活動 #{@event.name} 建立失敗"
    end
  end
  
  def edit
    @event = current_user.events.find(params[:id])
  end
  
  def update
    @event = current_user.events.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to event_path(@event), :notice => "成功更新活動 #{@event.name}"
    else
      redirect_to events_path, :error => "活動 #{@event.name} 更新失敗"
    end
  end
  
  def destroy
    @event = current_user.events.find(params[:id])
    if @event.destroy
      redirect_to events_path, :notice => "活動 #{@event.name} 已成功刪除"
    else
      redirect_to events_path, :error => "活動 #{@event.name} 刪除失敗"
    end
  end
  
  def lottery
    @event = Event.find(params[:event_id])
    @prizes = @event.prizes
    
    if (@event.is_lotteried == false)
      @event.update_attributes(:is_lotteried => true)
      @participants = @event.participants.order('random()')
    
      @prizes.each_with_index do |prize, i|
        prize.quantity.times do |j|
          @winner = @participants[i+j].update_attributes(:prize_id => prize.id)
        end
      end
    
      @winners = @event.participants.find(:all, :joins => :prize, :conditions => "prize_id IS NOT NULL" ) 
    end
  end
  
  def reset_winner
    @event = Event.find(params[:event_id])
    @event.update_attributes(:is_lotteried => false)
    @event.participants.update_all(:prize_id => nil)
    
    redirect_to event_path(@event), :notice => "得獎名單已重置"
  end
  
end
