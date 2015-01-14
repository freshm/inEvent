class EventsController < ApplicationController
  before_filter :authenticate_user!, except: :index

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @subscribed = SubscribedEvent.where(events_id: params[:id], participate: true)
    #binding.pry
  end

  def new
    @event = Event.new
  end

  def create
    #binding.pry
    @event = current_user.create_event event_params
    if @event.save!
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def participate
    s = SubscribedEvent.where(user_id: params[:current_user], events_id: params[:event]).first
    
    if s
      if s.participate == true
        respond_to do |format|
          msg = { :status => "not changed", :message => "Already participate!", action: "Nothing" }
          format.json  { render :json => msg, status: :bad_request }
        end
      else
        s.participate = true # just marking as assigned, but not partipcate
        s.save!
        respond_to do |format|
          msg = { :status => "ok", :message => "Success!", action: "Changed status" }
          format.json  { render :json => msg }
        end
      end
      
    else
      s = SubscribedEvent.create(user_id: params[:current_user], events_id: params[:event], participate: true)
      respond_to do |format|
        msg = { :status => "ok", :message => "Success!", action: "Newly participate" }
        format.json  { render :json => msg }
      end
    end
  end
  
  def mark_event
    #binding.pry
    s = SubscribedEvent.where(user_id: params[:current_user], events_id: params[:event]).first
    
    if s
      if s.participate == false
        respond_to do |format|
          msg = { :status => "not changed", :message => "Already marked!", action: "Nothing" }
          format.json  { render :json => msg, status: :bad_request }
        end
      else
        s.participate = false # just marking as assigned, but not partipcate
        s.save!
        respond_to do |format|
          msg = { :status => "ok", :message => "Success!", action: "Changed status" }
          format.json  { render :json => msg }
        end
      end
      
    else
      s = SubscribedEvent.create(user_id: params[:current_user], events_id: params[:event], participate: false)
      respond_to do |format|
        msg = { :status => "ok", :message => "Success!", action: "Newly marked" }
        format.json  { render :json => msg }
      end
    end
      
    
  end

  helper_method :title
  private

  def title
    "Events"
  end

  def event_params
    params.require(:event).permit :title, :appointment, :location, :max_participants, :description, :private, :picture
  end
end
