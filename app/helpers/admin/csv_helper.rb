module Admin::CsvHelper

  def link_to_csv(request, html_options={class: "button secondary"})
    link_to("Download CSV", UriQueryMerger.new(request.url, {format: :csv}).merge, html_options)
  end

end
