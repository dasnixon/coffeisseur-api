# == Schema Information
#
# Table name: coffee_shop_locations
#
#  id                 :integer          not null, primary key
#  phone_number       :string
#  phone_country_code :string
#  unit               :string
#  building           :string
#  street             :string
#  city               :string
#  region             :string
#  country            :string
#  address_code       :string
#  coffee_shop_id     :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class CoffeeShopLocationSerializer < ActiveModel::Serializer
  attributes :id, :phone_number, :phone_country_code, :unit, :building, :street,
    :city, :region, :country, :address_code
end
