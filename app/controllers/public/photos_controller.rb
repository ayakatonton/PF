class Public::PhotosController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def photo_params
    params.require(:photo).permit(:title, :body, :image)
  end
  
end
