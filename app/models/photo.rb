class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :event
  has_one :group, through: :event
end
