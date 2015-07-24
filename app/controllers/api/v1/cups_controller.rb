module Api
  module V1
    class CupsController < ApplicationController
      def index
        if params[:ids].present?
          render json: policy_scope(Cup).find(params[:ids])
        else
          render json: policy_scope(Cup)
        end
      end

      def show
        cup = Cup.find(params[:id])
        authorize(cup)
        render json: cup
      end

      def create
        cup = Cup.new(cup_params)
        authorize(cup)
        if cup.save
          render json: cup, status: :created
        else
          render json: { errors: cup.errors }, status: :unprocessable_entity
        end
      end

      def update
        cup = Cup.find(params[:id])
        authorize(cup)
        if cup.update(cup_params)
          render json: cup
        else
          render json: { errors: cup.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        cup = Cup.find(params[:id])
        authorize(cup)
        cup.destroy
        head :no_content
      end

      private

      def cup_params
        params.require(:cup).permit(*policy_scope(Cup).permitted_attributes)
      end
    end
  end
end
