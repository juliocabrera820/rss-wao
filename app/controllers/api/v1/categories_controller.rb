module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        categories = Category.all
        render json: categories, status: :ok
      end

      def create
        category = Category.new(category_params)
        if category.save
          render json: category, status: :ok
        else
          render json: category.errors, status: :unprocessable_entity
        end
      end

      private

      def category_params
        params.permit(:name)
      end
    end
  end
end
