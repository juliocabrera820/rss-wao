require 'open-uri'

class RssService
  def self.fetch(url)
    URI.open(url)
  end

  def self.collect(news, category_id)
    feed = RSS::Parser.parse(news)
    #puts "Title: #{feed.channel.title}"
    feed.items.each do |item|
      puts item
      new_item = New.new(title: item.title, description: item.description,
                         published: item.pubDate, url: item.link, category_id: category_id)
      new_item.save!
    end
  end
end
