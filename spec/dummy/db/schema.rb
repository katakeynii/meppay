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

ActiveRecord::Schema.define(version: 2021_12_22_130459) do

  create_table "mep_pay_dummy_declarations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mep_pay_notifications", force: :cascade do |t|
    t.string "ref_operation"
    t.decimal "montant"
    t.string "status"
    t.string "ref_ordre"
    t.datetime "paid_at"
    t.string "ref_payment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "mep_pay_transaction_id"
    t.index ["mep_pay_transaction_id"], name: "index_mep_pay_notifications_on_mep_pay_transaction_id"
  end

  create_table "mep_pay_reference_values", force: :cascade do |t|
    t.integer "mep_pay_reference_id", null: false
    t.integer "mep_pay_transaction_id", null: false
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mep_pay_reference_id"], name: "index_mep_pay_reference_values_on_mep_pay_reference_id"
    t.index ["mep_pay_transaction_id"], name: "index_mep_pay_reference_values_on_mep_pay_transaction_id"
  end

  create_table "mep_pay_references", force: :cascade do |t|
    t.string "code"
    t.string "libelle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mep_pay_request_events", force: :cascade do |t|
    t.string "request_id"
    t.string "user_agent"
    t.string "ip_address"
    t.text "event_detail"
    t.string "path"
    t.string "remote_ip"
    t.string "request_method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mep_pay_transaction_lines", force: :cascade do |t|
    t.string "code"
    t.decimal "montant"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "mep_pay_transaction_id", null: false
    t.index ["mep_pay_transaction_id"], name: "index_mep_pay_transaction_lines_on_mep_pay_transaction_id"
  end

  create_table "mep_pay_transactions", force: :cascade do |t|
    t.string "uuid"
    t.decimal "montant"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "typable_type", null: false
    t.integer "typable_id", null: false
    t.boolean "paid"
    t.datetime "paid_at"
    t.index ["typable_type", "typable_id"], name: "index_mep_pay_transactions_on_typable"
    t.index ["uuid"], name: "index_mep_pay_transactions_on_uuid", unique: true
  end

  add_foreign_key "mep_pay_notifications", "mep_pay_transactions"
  add_foreign_key "mep_pay_reference_values", "mep_pay_references"
  add_foreign_key "mep_pay_reference_values", "mep_pay_transactions"
  add_foreign_key "mep_pay_transaction_lines", "mep_pay_transactions"
end
