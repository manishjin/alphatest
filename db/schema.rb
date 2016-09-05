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

ActiveRecord::Schema.define(version: 20160905203805) do

  create_table "clients", force: :cascade do |t|
    t.text     "Name"
    t.text     "Address"
    t.string   "Type"
    t.text     "Billing_Address"
    t.string   "NIF"
    t.boolean  "Verified"
    t.integer  "company_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "clients", ["company_id"], name: "index_clients_on_company_id"

  create_table "companies", force: :cascade do |t|
    t.text     "Name"
    t.text     "Address"
    t.string   "NIF"
    t.string   "CreatedBy"
    t.string   "UpdatedBy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "Chat_ID"
    t.integer  "user_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "First_Name"
    t.string   "Last_Name"
    t.integer  "Telephone"
    t.string   "Email"
    t.string   "Truck_No"
    t.string   "Social_Sec"
    t.boolean  "Verified"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "Chat_ID"
  end

  add_index "drivers", ["company_id"], name: "index_drivers_on_company_id"

  create_table "employees", force: :cascade do |t|
    t.string   "First_Name"
    t.string   "Last_Name"
    t.integer  "Telephone"
    t.string   "Email"
    t.string   "Designation"
    t.string   "Social_Sec"
    t.string   "Country"
    t.integer  "company_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employees", ["company_id"], name: "index_employees_on_company_id"

  create_table "enquiries", force: :cascade do |t|
    t.string   "Name"
    t.string   "Email"
    t.integer  "Telephone"
    t.text     "Message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.boolean  "Sub_Shipment"
    t.integer  "Parent_Shipment_ID"
    t.string   "Status"
    t.integer  "Client_ID"
    t.text     "Client_Name"
    t.text     "Pickup_Location"
    t.date     "Pickup_Date"
    t.time     "Pickup_Start_Time"
    t.time     "Pickup_End_Time"
    t.integer  "Pickup_Gate"
    t.string   "Pickup_Contact_Person"
    t.integer  "Pickup_Contact_No"
    t.integer  "Weight"
    t.boolean  "Palletized"
    t.integer  "No_of_Pallets"
    t.text     "Dropoff_Location"
    t.date     "Dropoff_Date"
    t.time     "Dropoff_Start_Time"
    t.time     "Dropff_End_Time"
    t.integer  "Dropoff_Gate"
    t.string   "Dropoff_Contact_Person"
    t.integer  "Dropff_Contact_No"
    t.text     "Comments"
    t.text     "Cargo_Type"
    t.integer  "company_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "Allocated_Truck_Type"
    t.string   "Assigned_To"
    t.string   "Allocated_Company_ID"
    t.integer  "driver_id"
    t.string   "Allocated_Contact_Person"
    t.integer  "Allocated_Contact_No"
    t.date     "Allocation_Date"
    t.string   "Allocated_By"
    t.string   "Chat_ID"
    t.text     "Chat_Message"
    t.string   "Volume"
    t.boolean  "OtherClient"
    t.boolean  "OtherDriver"
    t.string   "Driver_Name"
  end

  add_index "shipments", ["company_id"], name: "index_shipments_on_company_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
