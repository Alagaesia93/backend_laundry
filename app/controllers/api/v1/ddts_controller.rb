# frozen_string_literal: true

# controllers/customer_products_controller.rb
module Api
  module V1
    # top class comment
    class DdtsController < ApplicationController
      before_action :set_customer, only: %i[index show update destroy]
      before_action :set_ddt, only: %i[show update destroy]

      # GET /ddts
      def index
        @ddts = @customer.ddts

        render json: @ddts
      end

      # GET /ddts/1
      def show
        render json: @ddt
      end

      # POST /ddts
      def create
        @ddt = Ddt.new(ddt_params)

        if @ddt.save
          render json: @ddt, status: :created, location: @ddt
        else
          render json: @ddt.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /ddts/1
      def update
        if @ddt.update(ddt_params)
          render json: @ddt
        else
          render json: @ddt.errors, status: :unprocessable_entity
        end
      end

      # DELETE /ddts/1
      def destroy
        @ddt.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_ddt
        @ddt = Ddt.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ddt_params
        params.require(:ddt).permit(:user_id, :customer_id)
      end

      def set_customer
        @customer = Customer.find(params[:customerId])
      end
    end
  end
end