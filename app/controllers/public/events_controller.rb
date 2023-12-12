class Public::EventsController < ApplicationController
  
  def index
    @events = Event.all
    @event = Event.new
  end

  def show
     @event = event.find(params[:id])
  end

  def new
    @event = Event.new
  end
  
  def create
     @event = Event.new(event_params)
    if @event.save
      redirect_to events_path, notice: '予定を追加しました'
    else
      render :index
    end
  end

  def edit
    @event = Event.find(params[:id])
  end
  
  def update
     @event= Event.find(params[:id])
  
    if @event.update(event_params)  
    flash[:notice] = "更新されました！"
    redirect_to public_calendar_index_path
    else 
    render :edit
    end
  end
  
  def destroy
      event = Event.find(params[:id])
      event.destroy
      redirect_to action: :index
  end
  
   private
  def event_params
      params.require(:event).permit(:title,:start_time,:end_time)
  end
  
end
