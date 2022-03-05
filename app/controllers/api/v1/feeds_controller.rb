module Api
  module V1
    class FeedsController < ApplicationController
      def index
        feeds = Feed.all
        render json: feeds, status: :ok
      end

      def create
        params[:feeds].each do |feed|
          url = feed[:url]
          rss = RssService.fetch(url)
          parsed_feed = RssService.parse_feed(rss)
          feed = Feed.new(name: parsed_feed.channel.title, url: url, category_id: category(feed[:category]).id)
          feed.save!
          collect_news(parsed_feed.items, feed.id)
        end
        render json: { message: 'feeds saved' }, status: :ok
      end

      def collect_news(news, feed_id)
        news.each do |item|
          new_item = New.new(title: item.title, description: item.description,
                             published: item.pubDate, url: item.link, feed_id: feed_id)
          new_item.save!
        end
      end

      def update_feeds
        recovered_feeds.each do |feed|
          rss = RssService.fetch(feed.fetch(:url))
          parsed_feed = RssService.parse_feed(rss)
          Feed.destroy_all
          feed = Feed.new(name: parsed_feed.channel.title, url: feed.fetch(:url), category_id: feed.fetch(:category_id))
          feed.save!
          collect_news(parsed_feed.items, feed.id)
        end
        render json: { message: 'feeds updated' }, status: :ok
      end

      def recovered_feeds
        feeds = Feed.all
        feeds.collect do |feed|
          { url: feed.url, category_id: feed.category_id }
        end
      end

      private

      def category(name)
        Category.find_by!(name: name)
      end
    end
  end
end
