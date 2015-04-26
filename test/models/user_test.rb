# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string           not null
#  last_name        :string           not null
#  email            :string           not null
#  roaster          :boolean          default(FALSE)
#  about            :text
#  username         :string
#  favorite_roaster :string
#  password_digest  :string
#  role             :string           default("non-admin")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
