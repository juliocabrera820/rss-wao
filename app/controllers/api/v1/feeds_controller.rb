module Api
  module V1
    class FeedsController < ApplicationController
      before_action :category, only: [:create]

      def index
        feeds = Feed.all
        render json: feeds, status: :ok
      end

      def create
        params[:urls].each do |url|
          rss = RssService.fetch(url)
          parsed_feed = RssService.parse_feed(rss)
          feed = Feed.new(name: parsed_feed.channel.title, url: url)
          feed.save!
          collect_news(parsed_feed.items, category.id, feed.id)
        end
        render json: { message: 'feeds saved' }, status: :ok
      end

      def collect_news(news, category_id, feed_id)
        news.each do |item|
          new_item = New.new(title: item.title, description: item.description,
                             published: item.pubDate, url: item.link, category_id: category_id,
                             feed_id: feed_id)
          new_item.save!
        end
      end

      private

      def category
        Category.find_by(name: params[:category])
      end
    end
  end
end
