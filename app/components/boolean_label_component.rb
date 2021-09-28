# frozen_string_literal: true

class BooleanLabelComponent < ViewComponent::Base
  attr_reader :value

  def initialize(value:)
    @value = value
  end

  private

  def badge_color
    case value
    when true
      'badge bg-success'
    when false
      'badge bg-danger'
    else
      'badge bg-secondary'
    end
  end
end
