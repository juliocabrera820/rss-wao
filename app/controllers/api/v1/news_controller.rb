module Api
  module V1
    class NewsController < ApplicationController
      def index
        news = New.where(feed_id: params[:id])
        render json: news, status: :ok
      end

      def search
        news = NewsQuery.search(params[:title])
        render json: news, status: :ok
      end

      def sort_by
        news = NewsQuery.sort_by_field(params[:sort])
        render json: news, status: :ok
      end
    end
  end
end
