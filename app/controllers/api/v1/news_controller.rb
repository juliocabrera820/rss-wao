module Api
  module V1
    class NewsController < ApplicationController
      def index
        news = New.where(feed_id: params[:id])
        render json: news, status: :ok
      end
    end
  end
end
