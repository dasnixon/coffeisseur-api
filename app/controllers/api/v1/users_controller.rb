module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: policy_scope(User)
      end

      def show
        @user = User.find(params[:id])
        authorize(@user)
        render json: User.find(params[:id])
      end

      def create
        user = User.new(user_params)
        authorize(user)
        if user.save
          render json: user.session_api_key, status: :created
        else
          render json: { errors: user.errors.to_hash }, status: :unprocessable_entity
        end
      end

      def me
        render json: current_user
      end

      private

      def user_params
        params.require(:user).permit(*policy(@user || User).permitted_attributes)
      end
    end
  end
end
