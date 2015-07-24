module Api
  module V1
    class RoastersController < ApplicationController
      def index
        if params[:ids].present?
          render json: policy_scope(Roaster).find(params[:ids])
        else
          render json: policy_scope(Roaster)
        end
      end

      def show
        roaster = roaster.find(params[:id])
        authorize(roaster)
        render json: roaster
      end

      def create
        roaster = Roaster.new(roaster_params)
        authorize(roaster)
        if roaster.save
          render json: roaster, status: :created
        else
          render json: { errors: roaster.errors }, status: :unprocessable_entity
        end
      end

      def update
        roaster = Roaster.find(params[:id])
        authorize(roaster)
        if roaster.update(roaster_params)
          render json: roaster
        else
          render json: { errors: roaster.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        roaster = Roaster.find(params[:id])
        authorize(roaster)
        roaster.destroy
        head :no_content
      end

      private

      def roaster_params
        params.require(:roaster).permit(*policy_scope(Roaster).permitted_attributes)
      end
    end
  end
end
