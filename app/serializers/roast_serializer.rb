# == Schema Information
#
# Table name: roasts
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  description  :text             not null
#  price_per_lb :integer
#  origin       :string
#  process      :string
#  roaster_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class RoastSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price_per_lb, :origin, :process

  has_one :roaster, embed: :ids
end
