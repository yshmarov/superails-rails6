# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def active_link_to(name, path)
    content_tag(:li, class: "#{'active fw-bold' if current_page?(path)} nav-item") do
      link_to name, path, class: "w-full px-4 py-2 text-base font-semibold text-center text-white transition duration-200 ease-in bg-pink-600 rounded-lg shadow-md hover:bg-pink-700 focus:ring-pink-500 focus:ring-offset-pink-200 focus:outline-none focus:ring-2 focus:ring-offset-2"
    end
  end

  def deep_active_link_to(path, &block)
    content_tag(:li, class: "#{'active fw-bold' if current_page?(path)} nav-item") do
      link_to path, class: 'nav-link font-medium tracking-wide text-gray-700 transition-colors
      duration-200 hover:text-deep-purple-accent-400', title: path.to_s, &block
    end
  end

  def deep_active_link_to_dropdown_item(path, &block)
    content_tag(:li) do
      link_to path, class: "#{'active fw-bold' if current_page?(path)} dropdown-item", &block
    end
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

  def markdown(text) # rubocop:todo Metrics/MethodLength
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
    markdown.render(text).html_safe # rubocop:todo Rails/OutputSafety
  end
end
