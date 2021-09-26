class Posts::ProgressComponentPreview < ViewComponent::Preview
  # layout false

  def render_boolean(value = false)
    if value
      render(BooleanLabelComponent.new(value: true)) { content_tag(:div, true) }
    else
      render(BooleanLabelComponent.new(value: false)) { content_tag(:div, false) }
    end
  end

  def with_votes
    render(Posts::ProgressComponent.new(post: Post.where.not(cached_scoped_like_votes_total: [0, nil]).first))
  end

  # renders nothing
  def without_votes
    render(Posts::ProgressComponent.new(post: Post.where(cached_scoped_like_votes_total: [0, nil]).first))
  end
end