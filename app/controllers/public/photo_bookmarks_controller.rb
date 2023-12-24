class Public::PhotoBookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo

  def index
    @event = Event.find(params[:event_id])
    @photos = @event.photos
  end
  
  def create
    @bookmark = current_user.photo_bookmarks.build(photo: @photo)
    if @bookmark.save
      redirect_to @photo, notice: 'Photo bookmarked successfully!'
    else
      redirect_to @photo, alert: 'Unable to bookmark this photo.'
    end
  end

  def destroy
    @bookmark = current_user.photo_bookmarks.find_by(photo: @photo)
    if @bookmark.destroy
      redirect_to @photo, notice: 'Bookmark removed.'
    else
      redirect_to @photo, alert: 'Unable to remove bookmark.'
    end
  end

  private

  def set_photo
    @photo = Photo.find(params[:event_photo_id])
  end
end
