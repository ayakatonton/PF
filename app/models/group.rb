class Group < ApplicationRecord
  # belongs_to :user, through: :groupusers
  has_many :groupusers, dependent: :destroy
  belongs_to :owner, class_name: 'User'
  has_many :events
  has_many :photos
 
  validates :name, presence: true
  validates :introduction, presence: true
  has_one_attached :image
  
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
  
  # def includesUser?(user)
  #   group_users.exists?(user_id: user.id)
  # end
  def is_owned_by?(user)
    owner.id == user.id
  end
end
