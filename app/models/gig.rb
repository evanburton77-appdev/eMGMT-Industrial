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
class Gig < ApplicationRecord
  belongs_to :user
  belongs_to :agent, counter_cache: true, optional: true
end
