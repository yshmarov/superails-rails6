class BooleanLabelComponentPreview < ViewComponent::Preview
  # layout false

  def when_true
    render(BooleanLabelComponent.new(value: true)) do
      # "#{true}"
      content_tag(:div, true)
    end
  end

  def when_false
    render(BooleanLabelComponent.new(value: false)) do
      # "#{true}"
      content_tag(:div, false)
    end
  end
end