class Public::EventPhotosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @event = Event.find(params[:event_id])
    @photos = @event.photos
  end

  def show
     @event = Event.find(params[:event_id])
  end

  def new
     @event = Event.find(params[:event_id])
     @photo = Photo.new
  end
  
  def create
     @event = Event.find(params[:event_id])
     @photo = @event.photos.new(event_photo_params)
    if @event.save
      redirect_to event_event_photos_path(@event), notice: '写真を共有しました'
    else
     puts @event.errors.full_messages
      render :index
    end
  end

  def edit
    @event = Event.find(params[:event_id])
    @photo = Photo.find(params[:id])
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
      event = Event.find(params[:event_id])
      event.photos.find(params[:id]).destroy
      redirect_to action: :index
  end
  
   private
  def event_photo_params
      params.require(:photo).permit(:image,:event_date,:group_id,:other_attributes)
  end
  
  
end
