# app/controllers/api/v1/categories_controller.rb

module Api
  module V1
    class CategoriesController < ApplicationController
      include CategoriesHelper

      before_action :set_category, only: [:show, :update, :destroy]

      def index
        render json: categories
      end

      def show
        render json: @category
      end

      def create
        @category = Category.new(category_params)
        process_category('save')
      end

      def update
        process_category('update')
      end

      def destroy
        process_category('destroy')
      end
    end
  end
end
