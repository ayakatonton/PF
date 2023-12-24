class Public::PhotosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @photos = current_user.photos
  end

  def show
    @photo = Photo.find(params[:id])
    @event =  Event.find(params[:event_id])
  end

  def new
    @photo = Photo.new
    @event = event = Event.find(params[:event_id])
  end

  def edit
  end
  
  def create
    @event = Event.find(params[:id]) 
    @photo = @event.photos.new(photo_params)
    if @photo.save
      redirect_to event_photo_path(@event,@photo), notice: '写真を共有しました'
    else
      puts @photo.errors.full_messages
      render :new
    end
  end
  
  def photo_params
    params.require(:photo).permit(:title, :body, :image)
  end
  
  private
  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end
end
