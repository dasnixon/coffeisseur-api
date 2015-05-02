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
        user = User.new(permitted_attributes(User))
        authorize(user)
        if user.save
          render json: user.session_api_key, status: :created
        else
          render json: { errors: user.errors.to_hash }, status: :unprocessable_entity
        end
      end
    end
  end
end
