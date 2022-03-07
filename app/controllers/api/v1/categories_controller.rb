module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        categories = Category.all
        render json: categories, each_serializer: CategorySerializer, status: :ok
      end

      def create
        category = Category.new(name: params[:category])
        if category.save
          render json: category, status: :ok
        else
          render json: category.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
