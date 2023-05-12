# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_05_12_195055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "photo", default: "https://i.pinimg.com/originals/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg"
    t.string "linkedin_url"
    t.string "timezone"
    t.string "organization_name"
    t.string "about"
    t.integer "messages_count", default: 0
    t.integer "gigs_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "website"
    t.string "twitter"
    t.string "instagram"
    t.string "facebook"
    t.string "phone"
    t.string "mobile"
    t.string "address"
    t.index ["email"], name: "index_agents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_agents_on_reset_password_token", unique: true
  end

  create_table "gigs", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.bigint "agent_id"
    t.string "description"
    t.string "industry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agent_id"], name: "index_gigs_on_agent_id"
    t.index ["user_id"], name: "index_gigs_on_user_id"
  end

  create_table "gpts", force: :cascade do |t|
    t.string "content"
    t.string "role"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_gpts_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "agent_id", null: false
    t.string "content"
    t.string "subject"
    t.boolean "read_receipt_user", default: false
    t.boolean "read_receipt_manager", default: false
    t.string "reaction_user"
    t.string "reaction_manager"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sender_id"
    t.index ["agent_id"], name: "index_messages_on_agent_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "agent_id", null: false
    t.bigint "gig_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agent_id"], name: "index_requests_on_agent_id"
    t.index ["gig_id"], name: "index_requests_on_gig_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "photo", default: "https://i.pinimg.com/originals/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg"
    t.string "timezone"
    t.string "about"
    t.integer "messages_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "website"
    t.string "twitter"
    t.string "instagram"
    t.string "facebook"
    t.string "phone"
    t.string "mobile"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "gigs", "agents"
  add_foreign_key "gigs", "users"
  add_foreign_key "gpts", "users"
  add_foreign_key "messages", "agents"
  add_foreign_key "messages", "users"
  add_foreign_key "requests", "agents"
  add_foreign_key "requests", "gigs"
  add_foreign_key "requests", "users"
end
