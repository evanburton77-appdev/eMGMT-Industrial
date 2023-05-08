# == Schema Information
#
# Table name: messages
#
#  id                   :bigint           not null, primary key
#  content              :string
#  reaction_manager     :string
#  reaction_user        :string
#  read_receipt_manager :boolean          default(FALSE)
#  read_receipt_user    :boolean          default(FALSE)
#  subject              :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  agent_id             :bigint           not null
#  sender_id            :integer
#  user_id              :bigint           not null
#
# Indexes
#
#  index_messages_on_agent_id  (agent_id)
#  index_messages_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (agent_id => agents.id)
#  fk_rails_...  (user_id => users.id)
#
class Message < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :agent, counter_cache: true
end
