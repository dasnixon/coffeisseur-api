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

  validates :password, length: { minimum: 8 }

  def admin?
    role == 'admin'
  end

  def non_admin?
    role == 'non-admin'
  end
end
