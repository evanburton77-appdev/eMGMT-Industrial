# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  about                  :string
#  address                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  facebook               :string
#  first_name             :string
#  instagram              :string
#  last_name              :string
#  messages_count         :integer          default(0)
#  mobile                 :string
#  phone                  :string
#  photo                  :string           default("https://i.pinimg.com/originals/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg")
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  timezone               :string
#  twitter                :string
#  website                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :gigs, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :gpts, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  enum timezone: { EST: "EST", CST: "CST", MST: "MST", PST: "PST" }
    def self.ransackable_attributes(auth_object = User)
    ["about", "created_at", "email", "encrypted_password", "first_name", "id", "last_name", "messages_count", "photo", "remember_created_at", "reset_password_sent_at", "reset_password_token", "timezone", "updated_at"]
  end
end
