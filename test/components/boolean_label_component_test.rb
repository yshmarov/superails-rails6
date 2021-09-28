require "test_helper"

class BooleanLabelComponentTest < ViewComponent::TestCase
  def test_when_true
    assert_equal(
     %(<span class="badge bg-success">true</span>),
     render_inline(BooleanLabelComponent.new(value: true)).to_html
    )
  end

  def test_when_false
    render_inline(BooleanLabelComponent.new(value: false)).to_html

    assert_selector("span[class='badge bg-danger']", text: "false")
    assert_text("false")
  end

  def test_when_other
    render_inline(BooleanLabelComponent.new(value: 'abc')).to_html

    assert_selector("span[class='badge bg-secondary']", text: "abc")
    assert_text("abc")
  end

end
