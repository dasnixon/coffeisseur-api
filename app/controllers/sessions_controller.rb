class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    super do |user|
      session_data = { token:  user.authentication_token, email: user.email }
      render json: session_data, status: :created and return
    end
  end
end
