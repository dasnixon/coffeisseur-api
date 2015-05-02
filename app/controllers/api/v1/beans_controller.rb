module Api
  module V1
    class BeansController < ApplicationController
      before_action :lookup_bean, only: [:show, :update]

      def index
        beans = policy_scope(Bean)
        render json: beans, root: 'beans'
      end

      def show
        authorize(@bean)
        render json: @bean, root: 'bean'
      end

      def create
        bean = Bean.new(permitted_attributes(Bean))
        authorize(bean)
        if bean.save
          render json: bean
        else
          render json: { errors: bean.errors.to_hash }, status: :unprocessable_entity
        end
      end

      def update
        authorize(@bean)
        if @bean.update(permitted_attributes(@bean))
          render json: @bean, status: :accepted
        else
          render json: { errors: bean.errors.to_hash }, status: :unprocessable_entity
        end
      end

      private

      def lookup_bean
        @bean = policy_scope(Bean).find(params[:id])
      end
    end
  end
end
