class Posts::ProgressComponentPreview < ViewComponent::Preview
  # layout false

  def with_votes
    render(Posts::ProgressComponent.new(post: Post.where.not(cached_scoped_like_votes_total: [0, nil]).first))
  end

  def without_votes
    render(Posts::ProgressComponent.new(post: Post.where(cached_scoped_like_votes_total: [0, nil]).first))
  end
end