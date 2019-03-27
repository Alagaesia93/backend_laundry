# frozen_string_literal: true

# controllers/customer_products_controller.rb
module Api
  module V1
    # top class comment
    class DdtProductsController < ApplicationController
      before_action :set_ddt_product, only: [:show, :update, :destroy]

      # GET /ddt_products
      def index
        @ddt_products = DdtProduct.all

        render json: @ddt_products
      end

      # GET /ddt_products/1
      def show
        render json: @ddt_product
      end

      # POST /ddt_products
      def create
        @ddt_product = DdtProduct.new(ddt_product_params)

        if @ddt_product.save
          render json: @ddt_product, status: :created, location: @ddt_product
        else
          render json: @ddt_product.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /ddt_products/1
      def update
        if @ddt_product.update(ddt_product_params)
          render json: @ddt_product
        else
          render json: @ddt_product.errors, status: :unprocessable_entity
        end
      end

      # DELETE /ddt_products/1
      def destroy
        @ddt_product.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_ddt_product
        @ddt_product = DdtProduct.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ddt_product_params
        params.require(:ddt_product).permit(:ddt_id, :product_id, :quantity)
      end
    end
  end
end