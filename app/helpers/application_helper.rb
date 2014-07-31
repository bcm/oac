require 'uri'

module ApplicationHelper
  URI_ESCAPE_URL_REGEX = Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")
  def uri_escape_url(url)
    URI.escape(url, URI_ESCAPE_URL_REGEX)
  end

  def auth_path(provider)
    "/auth/#{provider}"
  end

  def alert_boxes
    out = [:danger, :success, :info].each_with_object([]) do |level, m|
      m << content_tag(:div, data: {alert: level}, style: (flash[level] ? '' : 'display:none')) do
        if flash[level]
          content_tag(:div, class: "alert alert-#{level} alert-dismissable") do
            out2 = []
            out2 << button_tag(raw('&times;'), type: 'button', class: 'close', data: {dismiss: 'alert'},
                               :'aria-hidden' => true)
            out2 << raw(flash[level])
            safe_join(out2, "\n")
          end
        end
      end
    end
    safe_join(out, "\n")
  end
end
