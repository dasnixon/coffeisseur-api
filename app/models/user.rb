# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string           not null
#  last_name        :string           not null
#  email            :string           not null
#  roaster          :boolean          default(FALSE)
#  about            :text
#  username         :string
#  favorite_roaster :string
#  password_digest  :string
#  role             :string           default("non-admin")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :roasts, dependent: :destroy
  has_many :beans, through: :roasts
  has_many :api_keys, dependent: :destroy

  validates :password, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def admin?
    role == 'admin'
  end

  def non_admin?
    role == 'non-admin'
  end

  def session_api_key
    api_keys.active.session.first_or_create
  end
end
