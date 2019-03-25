# frozen_string_literal: true

# controllers/customer_products_controller.rb
module Api
  module V1
    # top level comment
    class CustomerProductsController < ApplicationController
      before_action :set_customer_product, only: %i[show update destroy]
      before_action :authorize_access_request!, except: %i[show index]

      # GET /customer_products
      def index
        @customer_products = CustomerProduct.all

        render json: @customer_products
      end

      # GET /customer_products/1
      def show
        render json: @customer_product
      end

      # POST /customer_products
      def create
        @customer_product = CustomerProduct.new(customer_product_params)

        if @customer_product.save
          render json: @customer_product, status: :created, location: @customer_product
        else
          render json: @customer_product.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /customer_products/1
      def update
        if @customer_product.update(customer_product_params)
          render json: @customer_product
        else
          render json: @customer_product.errors, status: :unprocessable_entity
        end
      end

      # DELETE /customer_products/1
      def destroy
        @customer_product.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_customer_product
        @customer_product = CustomerProduct.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def customer_product_params
        params.require(:customer_product).permit(:customer_id, :product_id, :min_size, :price)
      end
    end
  end
end
