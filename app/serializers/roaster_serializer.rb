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

class RoasterSerializer < ActiveModel::Serializer
  attributes :id, :name, :founded, :description, :site, :email, :phone,
    :phone_country_code

  has_many :roasts, embed: :ids
end
