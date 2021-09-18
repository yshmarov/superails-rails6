class AvatarComponentPreview < ViewComponent::Preview
  def with_image
    render(AvatarComponent.new(user: User.where.not(image: nil).first))
  end

  def without_image
    render(AvatarComponent.new(user: User.where(image: nil).first))
  end
end
