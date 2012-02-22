# encoding: utf-8
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
    
    redirect_to event_participants_url(@event)
  end
  
  def csv_import
    require 'csv'
    require 'fileutils'
    tmp = params[:dump][:csvfile].tempfile
    file = File.join("doc", params[:dump][:csvfile].original_filename)
    FileUtils.cp tmp.path, file
    
    @event = Event.find(params[:event_id])
    
    CSV.foreach(file) do |row|
      @participant = @event.participants.new(
        :name => row[0],
        :event_id => @event.id
      )
      @participant.save
    end
    FileUtils.rm file
    @event.update_attributes(:is_imported => true)
    redirect_to event_path(@event), :notice => "資料匯入成功"
  end
  
  def reset_participants
    @event = Event.find(params[:event_id])
    @event.update_attributes(:is_imported => false)
    @event.participants.destroy
    
    redirect_to event_path(@event), :notice => "參加者名單已重置"
  end
  
end
