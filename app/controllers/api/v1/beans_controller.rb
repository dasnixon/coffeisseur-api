module Api
  module V1
    class BeansController < ApplicationController
      before_action :lookup_bean, only: [:show, :update]

      def index
        beans = policy_scope(Bean)
        render json: beans
      end

      def show
        authorize(@bean)
        render json: @bean
      end

      def create
        bean = Bean.new(bean_params)
        authorize(bean)
        if bean.save
          render json: bean
        else
          render json: { errors: bean.errors.to_hash }, status: :unprocessable_entity
        end
      end

      def update
        authorize(@bean)
        if @bean.update(bean_params)
          render json: @bean, status: :accepted
        else
          render json: { errors: bean.errors.to_hash }, status: :unprocessable_entity
        end
      end

      private

      def lookup_bean
        @bean = policy_scope(Bean).find(params[:id])
      end

      def bean_params
        params.require(:bean).permit(*policy(@bean || Bean).permitted_attributes)
      end
    end
  end
end
