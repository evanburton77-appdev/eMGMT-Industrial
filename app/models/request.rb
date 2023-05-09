# == Schema Information
#
# Table name: requests
#
#  id         :bigint           not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  agent_id   :bigint           not null
#  gig_id     :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_requests_on_agent_id  (agent_id)
#  index_requests_on_gig_id    (gig_id)
#  index_requests_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (agent_id => agents.id)
#  fk_rails_...  (gig_id => gigs.id)
#  fk_rails_...  (user_id => users.id)
#
class Request < ApplicationRecord
  belongs_to :user
  belongs_to :agent
  belongs_to :gig
end
