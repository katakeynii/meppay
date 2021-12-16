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

ActiveRecord::Schema.define(version: 2021_12_15_191306) do

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
    t.index ["typable_type", "typable_id"], name: "index_mep_pay_transactions_on_typable"
    t.index ["uuid"], name: "index_mep_pay_transactions_on_uuid", unique: true
  end

  add_foreign_key "mep_pay_reference_values", "mep_pay_references"
  add_foreign_key "mep_pay_reference_values", "mep_pay_transactions"
  add_foreign_key "mep_pay_transaction_lines", "mep_pay_transactions"
end
