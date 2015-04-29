module Api
  module V1
    class RoastsController < ApplicationController
      before_action :lookup_roast, only: [:show, :update]

      def index
        roasts = policy_scope(Roast)
        render json: roasts, root: 'roasts'
      end

      def show
        render json: @roast, root: 'roast'
      end

      def create
        roast = Roast.new(permitted_attributes(Roast))
        if roast.save
          render json: roast
        else
          render json: { errors: roast.errors.to_hash }, status: :unprocessable_entity
        end
      end

      def update
        if @roast.update(permitted_attributes(@roast))
          render json: roast, status: :accepted
        else
          render json: { errors: roast.errors.to_hash }, status: :unprocessable_entity
        end
      end

      private

      def lookup_roast
        @roast = policy_scope(Roast).find(params[:id])
      end
    end
  end
end
