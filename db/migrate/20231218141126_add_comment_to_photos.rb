class AddCommentToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :comment, :text
  end
end
