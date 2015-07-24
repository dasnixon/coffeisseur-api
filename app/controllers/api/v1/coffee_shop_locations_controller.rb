module Api
  module V1
    class CoffeeShopLocationsController < ApplicationController
      def index
        if params[:ids].present?
          render json: policy_scope(coffee_shop.locations).find(params[:ids])
        else
          render json: policy_scope(coffee_shop.locations)
        end
      end

      def show
        location = CoffeeShopLocation.find(params[:id])
        authorize(location)
        render json: location
      end

      def create
        location = CoffeeShopLocation.new(location_params)
        authorize(location)
        if location.save
          render json: location, status: :created
        else
          render json: { errors: location.errors }
        end
      end

      def update
        location = CoffeeShopLocation.find(params[:id])
        authorize(location)
        if location.update(location_params)
          render json: location
        else
          render json: { errors: location.errors }
        end
      end

      def destroy
        location = CoffeeShopLocation.find(params[:id])
        authorize(location)
        location.destroy
        head :no_content
      end

      private

      def coffee_shop
        @coffee_shop ||= CoffeeShop.find(params[:coffee_shop_id])
      end

      def location_params
        params.require(:coffee_shop_location).permit(*policy(CoffeeShopLocation).permitted_attributes)
      end
    end
  end
end
