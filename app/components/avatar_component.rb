# frozen_string_literal: true

class AvatarComponent < ViewComponent::Base
  def initialize(user:, size: nil)
    @user = user
    @size = size
  end

  def size
    return '30x30' unless @size.present?
    
    @size
  end
end
