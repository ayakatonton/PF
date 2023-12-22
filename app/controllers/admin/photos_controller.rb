class Admin::PhotosController < ApplicationController
  def index
    @photos = Photos.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
