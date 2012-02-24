# encoding: utf-8
class ParticipantsController < ApplicationController
  
  def index
    @event = Event.find(params[:event_id])
    @participants = @event.participants.paginate(:page => params[:page], :per_page => 50 )
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
        :phone_number => row[1],
        :email => row[2],
        :custom_id => row[3],
        :event_id => @event.id
      )
      @participant.save
    end
    FileUtils.rm file
    redirect_to event_path(@event), :notice => "資料匯入成功"
  end
  
  def reset_participants
    @event = Event.find(params[:event_id])
    @event.participants.destroy_all
    
    redirect_to event_path(@event), :notice => "參加者名單已重置"
  end
  
end
