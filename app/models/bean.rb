# == Schema Information
#
# Table name: beans
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  description     :text             not null
#  attributes      :text
#  degree_of_roast :string           not null
#  farm            :string
#  varietal        :string
#  processing      :string
#  grade           :string
#  appearance      :string
#  country         :string           not null
#  region          :string           not null
#  organic         :boolean          default(FALSE)
#  espresso        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Bean < ActiveRecord::Base
end