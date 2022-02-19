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

      def filter
        if params[:title].present?
          return search
        elsif params[:sort].present?
          return sort_by
        end

        news = New.all
        render json: news, each_serializer: NewSerializer, status: :ok
      end

      def search
        new_found = NewsQuery.search(params[:title])
        render json: new_found, each_serializer: NewSerializer, status: :ok
      end

      def sort_by
        news = NewsQuery.sort_by_field(params[:sort])
        render json: news, each_serializer: NewSerializer, status: :ok
      end

      private

      def new
        New.find(params[:id])
      end
    end
  end
end
