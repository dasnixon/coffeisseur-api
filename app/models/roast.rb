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

class Roast < ActiveRecord::Base
  belongs_to :roaster
  has_many :cups, dependent: :destroy
  has_and_belongs_to_many :coffee_shops

  validates :name, :description, presence: true
end
