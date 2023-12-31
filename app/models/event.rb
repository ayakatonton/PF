class Event < ApplicationRecord
  belongs_to :group
  has_many :schedules
  has_many :photos
  
  validates :title, presence: true
  validates :event_date, presence: true
            
  
 
  default_scope -> { order(start_time: :asc) }

#   validate  :start_end_check

   #時間の矛盾を防ぐ
#   def start_end_check
#      if self.start_time.present? && self.end_time.present?
#       errors.add(:end, "が開始時刻を上回っています。正しく記入してください。") if self.start > self.end 
#      end
#   end
end
