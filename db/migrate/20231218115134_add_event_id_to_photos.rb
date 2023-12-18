class AddEventIdToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :event_id, :integer
  end
end
