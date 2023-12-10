class CreatePhotoBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_bookmarks do |t|

      t.timestamps
    end
  end
end
