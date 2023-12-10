class CreateEventbookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :eventbookmarks do |t|

      t.timestamps
    end
  end
end
