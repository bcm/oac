require 'uri'

module ApplicationHelper
  URI_ESCAPE_URL_REGEX = Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")
  def uri_escape_url(url)
    URI.escape(url, URI_ESCAPE_URL_REGEX)
  end
end
