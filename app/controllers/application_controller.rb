class ApplicationController < ActionController::API
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  # Returns the active user associated with the access token if available
  def current_user
    api_key = ApiKey.active.where(access_token: token).first
    api_key ? api_key.user : nil
  end

  def token
    bearer = request.headers["HTTP_AUTHORIZATION"]
    bearer ||= request.headers["rack.session"].try(:[], 'Authorization')

    bearer.present? ? bearer.split.last : nil
  end

  private

  def user_not_authorized
    head :unauthorized
  end
end
