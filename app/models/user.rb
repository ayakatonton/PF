class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :photos
  has_many :photo_bookmarks
  has_many :event_bookmarks
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :permits, dependent: :destroy
  has_many :groups, through: :group_users
  
  # バリテーション
  # validates :name, uniqueness: true, presence: true, length: { minimum: 2, maximum: 20 }
# validates :introduction, length: { maximum: 100 }   
   
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
     profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
