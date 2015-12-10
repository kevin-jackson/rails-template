module PerPageHelper

  def per_page_select(request)
    content_tag(:ul, per_page_links)
  end

  def per_page_link(request, per_page)
    uri = UriQueryMerger.new(request.url, {per_page: per_page}).merge
    link_to("#{per_page} per page", uri.to_s)
  end

private

  def per_page_links
    [20, 50, 100, 250].collect do |per_page|
      content_tag(:li, per_page_link(request, per_page))
    end.join("").html_safe
  end

end
