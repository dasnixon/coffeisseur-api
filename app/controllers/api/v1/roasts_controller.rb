module Api
  module V1
    class RoastsController < ApplicationController
      def index
        if params[:ids].present?
          render json: policy_scope(roaster.roasts).find(params[:ids])
        else
          render json: policy_scope(roaster.roasts)
        end
      end

      def show
        roast = Roast.find(params[:id])
        authorize(roast)
        render json: roast
      end

      def create
        roast = Roast.new(roast_params)
        authorize(roast)
        if roast.save
          render json: roast, status: :created
        else
          render json: { errors: roast.errors }, status: :unprocessable_entity
        end
      end

      def update
        roast = Roast.find(params[:id])
        authorize(roast)
        if roast.update(roast_params)
          render json: roast
        else
          render json: { errors: roast.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        roast = Roast.find(params[:id])
        authorize(roast)
        roast.destroy
        head :no_content
      end

      private

      def roaster
        @roaster ||= Roaster.find(params[:roaster_id])
      end

      def roast_params
        params.require(:roast).permit(*policy_scope(Roast).permitted_attributes)
      end
    end
  end
end
