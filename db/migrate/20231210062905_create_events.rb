class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.datetime :start_time
      t.datetime :end_time
      t.date :event_date
      t.timestamps
    end
  end
end
