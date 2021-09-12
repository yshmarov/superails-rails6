class Post < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :comments, -> { order(created_at: :desc) }, as: :commentable, dependent: :destroy
  has_many :taggings
  has_many :tags, -> { order(:name) }, through: :taggings

  acts_as_votable

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  
  def should_generate_new_friendly_id?
    title_changed?
  end
  
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

  def upvote! user
    if user.voted_up_on? self, vote_scope: 'like'
      self.unvote_by user, vote_scope: 'like'
    else
      self.upvote_by user, vote_scope: 'like'
    end
  end

  def downvote! user
    if user.voted_down_on? self, vote_scope: 'like'
      self.unvote_by user, vote_scope: 'like'
    else
      self.downvote_by user, vote_scope: 'like'
    end
  end

  def bookmark! user
    if user.voted_up_on? self, vote_scope: 'bookmark'
      self.unvote_by user, vote_scope: 'bookmark'
    else
      self.upvote_by user, vote_scope: 'bookmark'
    end
  end

  def complete! user
    if user.voted_up_on? self, vote_scope: 'watchlist'
      self.unvote_by user, vote_scope: 'watchlist'
    else
      self.upvote_by user, vote_scope: 'watchlist'
    end
  end

  def watchlist! user
    if user.voted_down_on? self, vote_scope: 'watchlist'
      self.unvote_by user, vote_scope: 'watchlist'
    else
      self.downvote_by user, vote_scope: 'watchlist'
    end
  end

  def upvote_percentage
    cached_scoped_like_votes_up.to_d/cached_scoped_like_votes_total.to_d*100
  end

  def downvote_percentage
    cached_scoped_like_votes_down.to_d/cached_scoped_like_votes_total.to_d*100
  end
end
