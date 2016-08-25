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

ActiveRecord::Schema.define(version: 20160825015558) do

  create_table "records", force: :cascade do |t|
    t.date     "collection_date"
    t.string   "responsible_for_collecting"
    t.string   "medical_record_number"
    t.date     "birthday"
    t.date     "birthplace"
    t.string   "place_residence"
    t.integer  "age"
    t.integer  "sex"
    t.string   "breed"
    t.integer  "schooling"
    t.string   "family_income"
    t.integer  "dependent_income"
    t.integer  "marital_status"
    t.integer  "marital_status_duration"
    t.integer  "type_of_residence"
    t.integer  "characterization_of_housing"
    t.string   "characterization_of_housing_other"
    t.string   "occupation"
    t.integer  "situation_nch_sitema"
    t.string   "cause_of_death"
    t.integer  "diagnosis_time_and_end_of_treatment_years",  default: 0
    t.integer  "diagnosis_time_and_end_of_treatment_months", default: 0
    t.integer  "hsct_follow_up_of_the_nhc_years",            default: 0
    t.integer  "hsct_follow_up_of_the_nhc_months",           default: 0
    t.integer  "hla_major_tests"
    t.string   "hla_major_tests_other"
    t.integer  "there_examination_icd_10"
    t.string   "there_examination_icd_10_other"
    t.string   "diagnosis_doctor_in_medical_records"
    t.string   "described_comorbidities"
    t.string   "treatments_described"
    t.integer  "type_of_hsct"
    t.boolean  "presence_of_gvhd"
    t.integer  "forms_of_gvhd"
    t.integer  "survival_time_years",                        default: 0
    t.integer  "survival_time_months",                       default: 0
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                   default: ""
    t.string   "lastname",               default: ""
    t.string   "phone_number"
    t.integer  "rule",                   default: 3,       null: false
    t.string   "profile_image"
    t.string   "slug"
    t.boolean  "active",                 default: true,    null: false
    t.string   "locale",                 default: "pt-BR"
    t.integer  "account_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "login_at"
    t.datetime "logout_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
