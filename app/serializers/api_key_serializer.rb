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

class ApiKeySerializer < ActiveModel::Serializer
  attributes :id, :access_token
  has_one :user, embed: :ids, include: true
end
