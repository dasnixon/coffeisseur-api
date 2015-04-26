class BeanSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :attributes, :degree_of_roast, :farm,
    :varietal, :processing, :grade, :appearance, :country, :region, :organic,
    :espresso
end
