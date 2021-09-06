class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  MIN_BODY_LENGTH = 2
  MAX_BODY_LENGTH = 1000

  validates :body, presence: true
  validates :body, length: { minimum: MIN_BODY_LENGTH, maximum: MAX_BODY_LENGTH }

  def destroy
    update(deleted_at: Time.zone.now)
  end

  def find_parent
    return self.commentable unless self.commentable.is_a?(Comment)
    self.commentable.find_parent
  end

end
