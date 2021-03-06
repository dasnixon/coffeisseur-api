# == Schema Information
#
# Table name: roasters
#
#  id                 :integer          not null, primary key
#  name               :string           not null
#  founded            :datetime
#  description        :text
#  site               :string
#  email              :string
#  phone              :string
#  phone_country_code :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Roaster < ActiveRecord::Base
  has_many :roasts, dependent: :destroy

  validates :name, presence: true
  validates :email, email: true, allow_blank: true, uniqueness: true
end
