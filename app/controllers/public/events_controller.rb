class Public::EventsController < ApplicationController
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
      @events = event.where('start_time <= ? AND (end_time >= ? OR end_time IS NULL)', start_date.end_of_month.end_of_week, start_date.beginning_of_month.beginning_of_week)
  end

  def show
     @event = event.find(params[:id])
  end

  def new
    @event = Event.new
  end
  
  def create
    event = event.new(event_params)
      if event.save
          redirect_to :action => "index"
      else
          redirect_to :action => "new"
      end
  end

  def edit
    @event = event.find(params[:id])
  end
  
  def update
      event = event.find(params[:id])
      if event.update(event_params)
          redirect_to :action => "show", :id => event.id
      else
          redirect_to :action => "new"
      end
  end
  
  def destroy
      event = event.find(params[:id])
      event.destroy
      redirect_to action: :index
  
   private
  def event_params
      params.require(:event).permit(:title,:start_time,:end_time)
  end
  
end
