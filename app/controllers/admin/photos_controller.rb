class Admin::PhotosController < ApplicationController
  before_action :authenticate_admin!
  def index
    @photos = Photo.all
  end

  def show
  end

  def new
  end

  def edit
    @photo = Photo.find(params[:id])
    @event = @photo.event
  end
  
  def destroy
      Photo.find(params[:id]).destroy
      redirect_to action: :index
  end
end
