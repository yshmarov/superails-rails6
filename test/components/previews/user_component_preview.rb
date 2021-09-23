class UserComponentPreview < ViewComponent::Preview
  # layout false

  def user
    render(UserComponent.new(user: User.first))
  end

  def users
    render(UserComponent.with_collection(User.limit(3)))
  end

end