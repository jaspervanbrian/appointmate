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

ActiveRecord::Schema[7.1].define(version: 2024_05_06_183321) do
  create_table "booking_types", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "color", default: "#000000"
    t.integer "duration"
    t.boolean "payment_required", default: false
    t.integer "price"
    t.integer "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_booking_types_on_patient_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "status", default: 0
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean "customer_paid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "booking_type_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
  end

  create_table "patients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birthday"
    t.string "sex"
    t.string "mobile_number"
    t.string "street_address"
    t.string "suburb_address"
    t.string "postcode_address"
    t.string "state_address"
    t.string "medicare_card_number"
    t.string "medicare_individual_reference_number"
    t.string "medicare_card_expiry_date"
    t.string "private_health_fund"
    t.string "private_health_fund_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "booking_link"
    t.index ["booking_link"], name: "index_patients_on_booking_link", unique: true
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end

  add_foreign_key "booking_types", "patients"
end
