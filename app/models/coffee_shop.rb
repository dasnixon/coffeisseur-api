# == Schema Information
#
# Table name: coffee_shops
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  site        :string
#  email       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CoffeeShop < ActiveRecord::Base
  has_many :coffee_shop_locations, dependent: :destroy
  has_many :cups
  has_and_belongs_to_many :roasts
  has_many :purchased_roasts, through: :cups

  alias_method :locations, :coffee_shop_locations

  validates :email, email: true, allow_blank: true, uniqueness: true
  validates :name, presence: true
end
