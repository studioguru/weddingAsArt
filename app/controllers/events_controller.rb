class EventsController < ApplicationController
  before_action :set_photographer, only: ['index', 'new', 'create', 'update']

  def index
    @events = @photographer.events
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.photographer = @photographer
    @event.registry = Registry.new
    if @event.save
      # @photographer.events << @event
      redirect_to photographer_events_path(@photographer)
    else
      render action: 'new'
    end
  end

  private

    def set_photographer
      @photographer = Photographer.find(params[:photographer_id])
    end

    def event_params
      params.require(:event).permit(:partner2, :partner1, :client_email)
    end
end
