class Schedule < ApplicationRecord
  belongs_to :event
  
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
