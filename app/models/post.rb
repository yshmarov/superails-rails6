class Post < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :comments, as: :commentable

  acts_as_votable

  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, presence: true
  validates :description, presence: true
  validates :body, presence: true

  MAX_TITLE_LENGTH = 140
  MAX_DESCRIPTION_LENGTH = 200
  MAX_BODY_LENGTH = 50000

  validates :title, length: { maximum: MAX_TITLE_LENGTH }
  validates :description, length: { maximum: MAX_DESCRIPTION_LENGTH }
  validates :body, length: { maximum: MAX_BODY_LENGTH }

  scope :free, -> { where(premium: false) }
  scope :premium, -> { where(premium: true) }

  def upvote_percentage
    cached_votes_up.to_d/cached_votes_total.to_d*100
  end

  def downvote_percentage
    cached_votes_down.to_d/cached_votes_total.to_d*100
  end
end
