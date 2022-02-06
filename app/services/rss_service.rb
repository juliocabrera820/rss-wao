require 'open-uri'

class RssService
  def self.fetch(url)
    URI.open(url)
  end

  def self.parse_feed(feed)
    RSS::Parser.parse(feed)
  end
end
