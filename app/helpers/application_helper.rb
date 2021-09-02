# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def active_link_to(name, path)
    tag.li(class: "#{'active fw-bold' if current_page?(path)} nav-item") do
      link_to name, path, class: 'nav-link'
    end
  end

  def deep_active_link_to(path)
    tag.li(class: "#{'active fw-bold' if current_page?(path)} nav-item") do
      link_to path, class: 'nav-link' do
        yield
      end
    end
  end

  def deep_active_link_to_dropdown_item(path)
    tag.li() do
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
    tag.span(value, class: badge_color)
  end

  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  class HTML < Redcarpet::Render::HTML
   def initialize(extensions = {})
     super extensions.merge(link_attributes: { target: '_blank' })
   end
    include Rouge::Plugins::Redcarpet
  end

  def markdown(text)
    options = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow' },
      prettify: true
    }

    extensions = {
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      lax_spacing: true,
      no_intra_emphasis: true,
      strikethrough: true,
      superscript: true,
      disable_indented_code_blocks: true
    }

    # Redcarpet::Markdown.new(HTML.new(options), extensions).render(text).html_safe
    # these 3 lines do same as above 1 line
    renderer = HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end
end
