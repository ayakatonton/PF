class Public::SchedulesController < ApplicationController
  def index
    @schedules = schedule.all
    @schedule = schedule.new
    @groups = Group.where(user: current_user)
    @event = event = Event.find(params[:id])
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
    @event = Event.find(params[:event_id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
     @schedule= Schedule.find(params[:id])
  
    if @schedule.update(schedule_params)  
    flash[:notice] = "更新されました！"
    redirect_to public_calendar_index_path
    else 
    render :edit
    end
  end
  
  def create
     @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to public_calendar_index_path, notice: '予定を追加しました'
    else
     puts @schedule.errors.full_messages
      render :index
    end
  end
  
  private
  def schedule_params
      params.require(:schedule).permit(:title,:schedule_time,:group_id)
  end  
  
end