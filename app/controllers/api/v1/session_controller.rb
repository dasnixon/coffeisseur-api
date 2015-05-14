module Api
  module V1
    class SessionController < ApplicationController
      def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          render json: user.session_api_key, status: :created
        else
          render json: {}, status: :unauthorized
        end
      end
    end
  end
end
