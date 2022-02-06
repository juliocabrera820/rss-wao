module Api
  module V1
    class NewsController < ApplicationController
      def show
        rss = RssService.fetch(params[:url])
        category_name = params[:category]
        category = Category.new(name: category_name)
        category.save!
        RssService.collect(rss, category.id)
        render json: { message: 'works' }, status: :ok
      end
    end
  end
end
