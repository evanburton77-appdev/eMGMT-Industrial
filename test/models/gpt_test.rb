# == Schema Information
#
# Table name: gpts
#
#  id         :bigint           not null, primary key
#  content    :string
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_gpts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class GptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
