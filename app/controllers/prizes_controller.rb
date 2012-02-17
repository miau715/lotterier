# encoding: utf-8
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
    @prize.order_index = @event.prizes.size - 1
    if @prize.save
      redirect_to event_path(@event), :notice => "已加入新獎項 #{@prize.name}"
    else
      redirect_to event_path(@event), :error => "獎項寫入失敗"
    end
  end
  
  def edit
    @event = Event.find(params[:event_id])
    @prize = @event.prizes.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:event_id])
    @prize = @event.prizes.find(params[:id])
    if @prize.update_attributes(params[:prize])
      redirect_to event_path(@event), :notice => "已更新獎項 #{@prize.name}"
    else
      redirect_to event_path(@event), :error => "獎項更新失敗"
    end
  end
  
  def destroy
    @event = Event.find(params[:event_id])
    @prize = @event.prizes.find(params[:id])
    if @prize.destroy
      redirect_to event_url(@event), :notice => "獎項 #{@prize.name} 已刪除"
    else
      redirect_to event_url(@event), :error => "獎項 #{@prize.name} 刪除失敗"
    end
  end
  
  
end
