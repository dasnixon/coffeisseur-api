# == Schema Information
#
# Table name: api_keys
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  access_token :string
#  scope        :string
#  expired_at   :datetime
#  created_at   :datetime
#

class ApiKey < ActiveRecord::Base
  belongs_to :user

  before_create :generate_access_token, :set_expiry_date

  validates :scope, inclusion: { in: %w( session api ) }

  scope :session, -> { where(scope: 'session') }
  scope :api,     -> { where(scope: 'api') }
  scope :active,  -> { where('expired_at >= ?', Time.now) }

  private

  def set_expiry_date
    self.expired_at = session? ? 4.hours.from_now : 30.days.from_now
  end

  def session?
    self.scope == 'session'
  end

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
