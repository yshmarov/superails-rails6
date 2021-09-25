# frozen_string_literal: true

class BooleanLabelComponent < ViewComponent::Base
  attr_reader :value

  def initialize(value: false)
    @value = value
  end

  private

  def badge_color
    case value
    when true
      'badge bg-success'
    when false
      'badge bg-danger'
    # else not needed if we already have a default in the initialize (value: false)
    # else
    #   'badge bg-warning'
    end
  end
end
