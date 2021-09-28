class BooleanLabelComponentPreview < ViewComponent::Preview
  def when_true
    render(BooleanLabelComponent.new(value: true))
  end

  def when_false
    render(BooleanLabelComponent.new(value: false))
  end

  def when_other
    render(BooleanLabelComponent.new(value: 'abc'))
  end
end