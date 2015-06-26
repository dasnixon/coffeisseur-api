class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  before_filter :authenticate_user_from_token!

  private

  def authenticate_user_from_token!
    authenticate_with_http_token do |token, options|
      user = User.find_by(email: email) if options[:email].presence

      if user && Devise.secure_compare(user.authentication_token, token)
        sign_in user, store: false
      end
    end
  end

  def not_authorized
    head :unauthorized
  end
end
