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

ActiveRecord::Schema.define(version: 20180823093530) do

  create_table "users", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "email",            limit: 255
    t.text     "address",          limit: 65535
    t.string   "phone_number",     limit: 255
    t.string   "gender",           limit: 255
    t.string   "team",             limit: 255
    t.string   "funny_name",       limit: 255
    t.string   "job",              limit: 255
    t.string   "ref_no",           limit: 255
    t.string   "dob",              limit: 255
    t.string   "pay_days",         limit: 255
    t.string   "acc_no",           limit: 255
    t.string   "pf_no",            limit: 255
    t.string   "salary_structure", limit: 255
    t.string   "pan",              limit: 255
    t.string   "branch",           limit: 255
    t.string   "designation",      limit: 255
    t.string   "occupation",       limit: 255
    t.string   "grade",            limit: 255
    t.string   "leave_policy",     limit: 255
    t.string   "emp_name",         limit: 255
    t.string   "doj",              limit: 255
    t.string   "present_days",     limit: 255
    t.string   "bank_name",        limit: 255
    t.string   "esi_no",           limit: 255
    t.string   "att_structure",    limit: 255
    t.string   "uan",              limit: 255
    t.string   "department",       limit: 255
    t.string   "division",         limit: 255
    t.string   "section",          limit: 255
    t.string   "basic",            limit: 255
    t.string   "da",               limit: 255
    t.string   "hra",              limit: 255
    t.string   "loan",             limit: 255
    t.string   "canteen",          limit: 255
    t.string   "total_earnings",   limit: 255
    t.string   "total_deductions", limit: 255
    t.string   "net_salary",       limit: 255
    t.string   "in_words",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
