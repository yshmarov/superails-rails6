class AvatarComponentPreview < ViewComponent::Preview
  def default
  end

  def with_custom_size_image
    render(AvatarComponent.new(user: User.where.not(image: nil).first, size: '500x300'))
  end

  def with_custom_alt
    user = User.where.not(image: nil).first
    render(AvatarComponent.new(user: user, alt: user.email))
  end

  def with_image
    render(AvatarComponent.new(user: User.where.not(image: nil).first))
  end

  def without_image
    render(AvatarComponent.new(user: User.where(image: nil).first))
  end
end
