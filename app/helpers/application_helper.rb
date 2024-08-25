module ApplicationHelper
  def breadcrumbs
    parts = request.path.split("/").reject(&:empty?)

    parts.map.with_index do |part, index|
      # Build the path up to the current part
      path = "/" + parts[0..index].join("/")
      # Check if it's the last part (current page)
      if index == parts.length - 1
        content_tag(:span, part.titleize, class: "current-page")
      else
        link_to(part.titleize, path) + " > "
      end
    end.join.html_safe
  end
end
