# frozen_string_literal: true

class AvatarComponent < ViewComponent::Base
  attr_reader :src, :alt, :size, :display

  def initialize(src:, alt: 'default title', size: 30, display: false)
    @src = src
    @alt = alt
    @size = size
    @display = display
  end

  def render?
    display
  end
end
