class Comment < ApplicationRecord
  # belongs_to :user
  belongs_to :user, optional: true
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  def deleted?
    user.nil?
  end

  def destroy
    update(user: nil, content: nil)
  end
end
