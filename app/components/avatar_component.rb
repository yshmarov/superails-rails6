# frozen_string_literal: true

class AvatarComponent < ViewComponent::Base
  def initialize(user:, size: nil, alt: "default image alt")
    @user = user
    @size = size
    @alt = alt
  end

  def size
    return '30x30' unless @size.present?
    
    @size
  end
end
