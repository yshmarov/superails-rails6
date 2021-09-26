require "test_helper"

class BooleanLabelComponentTest < ViewComponent::TestCase
  def test_when_true
    assert_equal(
      %(<span class="badge bg-success">true</span>),
      render_inline(BooleanLabelComponent.new(value: true).with_content(true)).to_html
    )
  end

  def test_when_false
    render_inline(BooleanLabelComponent.new(value: false).with_content(false))
    assert_selector("span[class='badge bg-danger']", text: "false")
    assert_text('false')
  end

  def test_when_nil
    render_inline(BooleanLabelComponent.new(value: nil).with_content('abc'))
    assert_selector("span[class='badge bg-warning']", text: "abc")
    assert_text('ab')
  end
end
