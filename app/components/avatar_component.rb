# frozen_string_literal: true

class AvatarComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

  private
  
  def render?
    @user.image?
  end
end
