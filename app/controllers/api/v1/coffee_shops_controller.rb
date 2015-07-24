module Api
  module V1
    class CoffeeShopsController < ApplicationController
      def index
        if params[:ids].present?
          render json: policy_scope(CoffeeShop).find(params[:ids])
        else
          render json: policy_scope(CoffeeShop)
        end
      end

      def show
        coffee_shop = CoffeeShop.find(params[:id])
        authorize(coffee_shop)
        render json: coffee_shop
      end

      def create
        coffee_shop = CoffeeShop.new(coffee_shop_params)
        authorize(coffee_shop)
        if coffee_shop.save
          render json: coffee_shop, status: :created
        else
          render json: { errors: coffee_shop.errors }, status: :unprocessable_entity
        end
      end

      def update
        coffee_shop = CoffeeShop.find(params[:id])
        authorize(coffee_shop)
        if coffee_shop.update(coffee_shop_params)
          render json: coffee_shop
        else
          render json: { errors: coffee_shop.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        coffee_shop = CoffeeShop.find(params[:id])
        authorize(coffee_shop)
        coffee_shop.destroy
        head :no_content
      end
    end
  end
end
