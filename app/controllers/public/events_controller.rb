class Public::EventsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:group_id].present?
      @group = Group.find(params[:group_id])
      @events = Event.where(group_id: params[:group_id] ).page(params[:page]).per(8)
    else
      @events = Event.all.page(params[:page]).per(8)
    end
    @event = Event.new
    @groups = Group.where(user: current_user)
  end

  def show
     @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end
  
  def create
     @event = Event.new(event_params)
    if @event.save
      redirect_to public_calendar_index_path, notice: '予定を追加しました'
    else
     puts @event.errors.full_messages
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
      params.require(:event).permit(:title,:event_date,:group_id)
  end
  
end
