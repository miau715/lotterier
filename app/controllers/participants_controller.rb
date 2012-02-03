class ParticipantsController < ApplicationController
  
  def index
    @participants = Participant.all
  end
  
  def show
    @participant = Participant.find(params[:id])
  end
  
  def new
    @participant = Participant.new
  end
  
  def create
    @participant = Participant.new(params[:participant])
    @participant.save
    
    redirect_to participants_path
  end
  
  def edit
    @participant = Participant.find(params[:id])
  end
  
  def update
    @participant = Participant.find(params[:id])
    @participant.update_attributes(params[:participant])
    
    redirect_to participants_path
  end
  
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy
    
    redirect_to participants_path
  end
  
end
