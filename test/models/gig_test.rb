# == Schema Information
#
# Table name: gigs
#
#  id          :bigint           not null, primary key
#  description :string
#  industry    :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  agent_id    :bigint
#  user_id     :bigint           not null
#
# Indexes
#
#  index_gigs_on_agent_id  (agent_id)
#  index_gigs_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (agent_id => agents.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class GigTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
