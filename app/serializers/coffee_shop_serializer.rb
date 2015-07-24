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

class CoffeeShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :site, :email

  has_many :coffee_shop_locations, embed: :ids
end
