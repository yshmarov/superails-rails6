module ApplicationHelper
  include Pagy::Frontend

  def active_link_to(name, path)
    content_tag(:li, class: "#{'active fw-bold' if current_page?(path)} nav-item") do
      link_to name, path, class: "nav-link"
    end
  end 
  
  def deep_active_link_to(path)
    content_tag(:li, class: "#{'active fw-bold' if current_page?(path)} nav-item") do
      link_to path, class: "nav-link" do
        yield
      end
    end 
  end 
  
  def deep_active_link_to_dropdown_item(path)
    content_tag(:li) do
      link_to path, class: "#{'active fw-bold' if current_page?(path)} dropdown-item" do
        yield
      end
    end 
  end

  def boolean_label(value)
    case value
    when true
      badge_color = 'badge bg-success'
    when false
      badge_color = 'badge bg-danger'
    end
    content_tag(:span, value, class: badge_color)
  end

  def markdown(text)
    options = %i[
      hard_wrap autolink no_intra_emphasis tables fenced_code_blocks
      disable_indented_code_blocks strikethrough lax_spacing space_after_headers
      quote footnotes highlight underline
      ]
      Markdown.new(text, *options).to_html.html_safe
  end

end
