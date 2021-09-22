# frozen_string_literal: true

class AvatarComponent < ViewComponent::Base
  attr_reader :user, :size, :alt

  def initialize(user:, size: nil, alt: "default image alt")
    @user = user
    @size = size
    @alt = alt
  end

  private

  def image_size
    return '30x30' unless size.present?
    
    size
  end
end
