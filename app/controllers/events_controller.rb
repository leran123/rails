class EventsController < ApplicationController
  before_action :set_event, :only => [ :show, :edit, :update, :destroy]
  def index
    @events = Event.page(params[:page]).per(5)
  end

  def new
    @event = Event.new
  end

  def create
  	@event = Event.new(event_params)
  	if @event.save
      flash[:notice] = "event was successfully created"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def show
  	#@event = Event.find(params[:id])
    @page_title = @event.name
  end

  def edit
  	#@event = Event.find(params[:id])
  end

  def update
    flash[:notice] = "event was successfully updated"
    #@event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to :action => :show, :id => @event
    else
      render :action => :edit
    end
  end

  def destroy
    #@event = Event.find(params[:id])
    flash[:alert] = "event was successfully deleted"
    @event.destroy

    redirect_to :action => :index
  end

private

  def event_params
  	params.require(:event).permit(:name, :description)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
