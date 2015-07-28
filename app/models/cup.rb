# == Schema Information
#
# Table name: cups
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  description    :text
#  brew_process   :string
#  rating         :integer
#  coffee_shop_id :integer
#  roast_id       :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Cup < ActiveRecord::Base
  belongs_to :coffee_shop
  belongs_to :roast
  belongs_to :user

	validates :name, presence: true
end
