class Public::PhotosController < ApplicationController
  def index
    @photo = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def edit
  end
  
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @photo, notice: '写真を共有しました'
    else
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
