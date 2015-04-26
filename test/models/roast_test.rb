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

require 'test_helper'

class RoastTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
