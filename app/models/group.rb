class Group < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :photos
end
