class Group < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :photos
  
  def includesUser?(user)
    group_users.exists?(user_id: user.id)
  end
end
