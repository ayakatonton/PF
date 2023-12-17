class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.references :event, index: true, foreign_key: true
      t.timestamps
    end
  end
end
