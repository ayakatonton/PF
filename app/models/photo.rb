class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :event
  has_one :group, through: :event
  has_many :users, through: :photo_bookmarks
end
