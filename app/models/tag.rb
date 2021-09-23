class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings

  validates :name, presence: true
end
