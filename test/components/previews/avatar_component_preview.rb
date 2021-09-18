class AvatarComponentPreview < ViewComponent::Preview
  def when_image
    render(AvatarComponent.new(user: User.find(6)))
  end

  def when_no_image
    render(AvatarComponent.new(user: User.first))
  end
end
