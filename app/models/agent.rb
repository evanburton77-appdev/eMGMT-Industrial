# == Schema Information
#
# Table name: agents
#
#  id                     :bigint           not null, primary key
#  about                  :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  gigs_count             :integer          default(0)
#  last_name              :string
#  linkedin_url           :string
#  messages_count         :integer          default(0)
#  organization_name      :string
#  photo                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  timezone               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_agents_on_email                 (email) UNIQUE
#  index_agents_on_reset_password_token  (reset_password_token) UNIQUE
#
class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :gigs, dependent: :destroy
  enum timezone: { EST: "EST", CST: "CST", MST: "MST", PST: "PST" }
end
