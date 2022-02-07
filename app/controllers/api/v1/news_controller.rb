module Api
  module V1
    class NewsController < ApplicationController
      before_action :new, only: [:show]

      def index
        news = New.where(feed_id: params[:id])
        render json: news, each_serializer: NewSerializer, status: :ok
      end

      def show
        render json: new, each_serializer: NewSerializer, status: :ok
      end

      def search
        news = NewsQuery.search(params[:title])
        render json: news, status: :ok
      end

      def sort_by
        news = NewsQuery.sort_by_field(params[:sort])
        render json: news, status: :ok
      end

      private

      def new
        New.find(params[:id])
      end
    end
  end
end
