class RoastSerializer < ActiveModel::Serializer
  attributes :id, :degree_of_roast, :description, :roasted_with, :time, :first_crack_at,
    :second_crack_at, :favorite

  belongs_to :bean
end
