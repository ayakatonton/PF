class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :permits, dependent: :destroy
  has_many :users, through: :group_users
  belongs_to :owner, class_name: 'User'
  has_many :events
  has_many :photos
 
  validates :name, presence: true
  validates :introduction, presence: true
  has_one_attached :group_image
  
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
  
  # def includesUser?(user)
  #   group_users.exists?(user_id: user.id)
  # end
  def is_owned_by?(user)
    owner.id == user.id
  end
  
  def self.search(method, word)
  # 完全に一致するnameを持つGroupを検索
  if method == "perfect_match"
    @groups = Group.where(name: word)
  else
  # エラーメッセージ出したい
  end
  end
end
