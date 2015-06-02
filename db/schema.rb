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

ActiveRecord::Schema.define(version: 20150602174619) do

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
    t.integer  "doctor_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["doctor_id"], name: "index_answers_on_doctor_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "doctor_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "doctor_likes", ["doctor_id"], name: "index_doctor_likes_on_doctor_id", using: :btree
  add_index "doctor_likes", ["user_id"], name: "index_doctor_likes_on_user_id", using: :btree

  create_table "doctor_profiles", force: :cascade do |t|
    t.integer  "doctor_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.text     "address"
    t.integer  "phone_number"
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

  add_index "doctor_profiles", ["doctor_id"], name: "index_doctor_profiles_on_doctor_id", using: :btree

  create_table "doctors", force: :cascade do |t|
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
    t.string   "hospital"
    t.boolean  "verified",               default: false
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "doctors", ["email"], name: "index_doctors_on_email", unique: true, using: :btree
  add_index "doctors", ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true, using: :btree

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

  create_table "hospitals", force: :cascade do |t|
    t.text     "name"
    t.text     "address"
    t.string   "classification"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "verified"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "description"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "caption"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["doctor_id"], name: "index_questions_on_doctor_id", using: :btree
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

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.text     "address"
    t.integer  "phone_number"
    t.string   "ethnicity"
    t.string   "occupation"
    t.string   "religion"
    t.string   "marital_status"
    t.float    "weight"
    t.float    "height"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id", using: :btree

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
    t.boolean  "admin",                  default: false
    t.text     "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answer_likes", "answers"
  add_foreign_key "answer_likes", "users"
  add_foreign_key "answers", "doctors"
  add_foreign_key "answers", "questions"
  add_foreign_key "doctor_likes", "doctors"
  add_foreign_key "doctor_likes", "users"
  add_foreign_key "doctor_profiles", "doctors"
  add_foreign_key "follows", "questions"
  add_foreign_key "follows", "users"
  add_foreign_key "hospital_likes", "hospitals"
  add_foreign_key "hospital_likes", "users"
  add_foreign_key "questions", "doctors"
  add_foreign_key "questions", "users"
  add_foreign_key "reviews", "hospitals"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_profiles", "users"
end
