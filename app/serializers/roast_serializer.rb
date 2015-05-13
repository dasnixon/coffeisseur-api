# == Schema Information
#
# Table name: roasts
#
#  id              :integer          not null, primary key
#  degree_of_roast :string           not null
#  description     :text
#  roasted_with    :string
#  time            :integer          not null
#  first_crack_at  :integer
#  second_crack_at :integer
#  favorite        :boolean          default(FALSE)
#  bean_id         :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class RoastSerializer < ActiveModel::Serializer
  attributes :id, :degree_of_roast, :description, :roasted_with, :time, :first_crack_at,
    :second_crack_at, :favorite

  belongs_to :bean
end
