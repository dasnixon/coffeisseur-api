class ApplicationController < ActionController::API
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def current_user
    api_key.try(:user)
  end

  private

  def token
    bearer.present? ? bearer.split.last : nil
  end

  def api_key
    @api_key ||= ApiKey.active.find_by(access_token: token)
  end

  def bearer
    return @bearer if defined?(@bearer)
    @bearer = request.headers['HTTP_AUTHORIZATION']
    @bearer ||= request.headers['rack.session'].try(:[], 'Authorization')
  end

  def user_not_authorized
    head :unauthorized
  end
end
