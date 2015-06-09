# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150608225601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answer_likes", ["answer_id"], name: "index_answer_likes_on_answer_id", using: :btree
  add_index "answer_likes", ["user_id"], name: "index_answer_likes_on_user_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "doctor_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "doctor_likes", ["user_id"], name: "index_doctor_likes_on_user_id", using: :btree

  create_table "doctor_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hospital_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "doctor_lists", ["hospital_id"], name: "index_doctor_lists_on_hospital_id", using: :btree
  add_index "doctor_lists", ["user_id"], name: "index_doctor_lists_on_user_id", using: :btree

  create_table "doctor_verification_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hospital_id"
    t.text     "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "doctor_verification_requests", ["hospital_id"], name: "index_doctor_verification_requests_on_hospital_id", using: :btree
  add_index "doctor_verification_requests", ["user_id"], name: "index_doctor_verification_requests_on_user_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "follows", ["question_id"], name: "index_follows_on_question_id", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "hospital_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hospital_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "hospital_likes", ["hospital_id"], name: "index_hospital_likes_on_hospital_id", using: :btree
  add_index "hospital_likes", ["user_id"], name: "index_hospital_likes_on_user_id", using: :btree

  create_table "hospital_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hospital_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "hospital_lists", ["hospital_id"], name: "index_hospital_lists_on_hospital_id", using: :btree
  add_index "hospital_lists", ["user_id"], name: "index_hospital_lists_on_user_id", using: :btree

  create_table "hospital_verification_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hospital_id"
    t.text     "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "hospital_verification_requests", ["hospital_id"], name: "index_hospital_verification_requests_on_hospital_id", using: :btree
  add_index "hospital_verification_requests", ["user_id"], name: "index_hospital_verification_requests_on_user_id", using: :btree

  create_table "hospitals", force: :cascade do |t|
    t.text     "name"
    t.text     "address"
    t.string   "classification"
    t.string   "image"
    t.boolean  "verified"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "description"
    t.integer  "user_id"
  end

  add_index "hospitals", ["user_id"], name: "index_hospitals_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.text     "address"
    t.string   "phone_number"
    t.string   "ethnicity"
    t.string   "occupation"
    t.string   "religion"
    t.string   "marital_status"
    t.float    "weight"
    t.float    "height"
    t.string   "year_of_grad"
    t.string   "specialization"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "caption"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "hospital_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["hospital_id"], name: "index_reviews_on_hospital_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "image"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "verified",               default: false
    t.string   "hospital"
    t.string   "role"
    t.text     "bio"
    t.date     "date_of_birth"
    t.string   "gender"
    t.text     "address"
    t.string   "phone_number"
    t.string   "ethnicity"
    t.string   "occupation"
    t.string   "religion"
    t.string   "marital_status"
    t.float    "weight"
    t.float    "height"
    t.string   "year_of_grad"
    t.string   "specialization"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answer_likes", "answers"
  add_foreign_key "answer_likes", "users"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "doctor_likes", "users"
  add_foreign_key "doctor_likes", "users"
  add_foreign_key "doctor_lists", "hospitals"
  add_foreign_key "doctor_lists", "users"
  add_foreign_key "doctor_verification_requests", "hospitals"
  add_foreign_key "doctor_verification_requests", "users"
  add_foreign_key "follows", "questions"
  add_foreign_key "follows", "users"
  add_foreign_key "hospital_likes", "hospitals"
  add_foreign_key "hospital_likes", "users"
  add_foreign_key "hospital_lists", "hospitals"
  add_foreign_key "hospital_lists", "users"
  add_foreign_key "hospital_verification_requests", "hospitals"
  add_foreign_key "hospital_verification_requests", "users"
  add_foreign_key "hospitals", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "questions", "users"
  add_foreign_key "reviews", "hospitals"
  add_foreign_key "reviews", "users"
end
