# frozen_string_literal: true

class PostProgressComponent < ViewComponent::Base
  def initialize(post:)
    @post = post
  end

  # def render?
  #   @post.votes_for.any?
  # end

  def upvote_percentage
    number_to_percentage(@post.upvote_percentage, precision: 0)
  end

  def downvote_percentage
    number_to_percentage(@post.downvote_percentage, precision: 0)
  end
  
  def cached_scoped_like_votes_down
    @post.cached_scoped_like_votes_down if @post.cached_scoped_like_votes_total.nonzero?
  end

  def cached_scoped_like_votes_up
    @post.cached_scoped_like_votes_up if @post.cached_scoped_like_votes_total.nonzero?
  end
end
