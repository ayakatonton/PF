class Public::SchedulesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @event = Event.find(params[:event_id])
    @schedules = @event.schedules
    @schedule = Schedule.new
    @groups = Group.where(user: current_user)
    @events = Event.where(group: @groups)
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
    @event = Event.find(params[:event_id])
  end

  def edit
     @event = Event.find(params[:event_id]) # :event_idを使用してイベントを見つける
     @schedule = Schedule.find(params[:id])
  end
  
  def update
     @schedule = Schedule.find(params[:id])
  
    if @schedule.update(schedule_params)  
    flash[:notice] = "更新されました！"
    redirect_to event_path(@schedule.event)
    else 
    render :edit
    end
  end
  
  def create
     @event = Event.find(params[:event_id]) 
     @schedule = @event.schedules.build(schedule_params)
    if @schedule.save!
      redirect_to event_schedules_path, notice: '予定を追加しました'
    else
     puts @schedule.errors.full_messages
      render :index
    end
  end
  
  private
  def schedule_params
      params.require(:schedule).permit(:title,:schedule_time,:group_id,:start_time,:end_time)
  end  
  
end