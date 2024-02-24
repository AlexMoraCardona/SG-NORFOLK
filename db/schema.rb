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

ActiveRecord::Schema[7.0].define(version: 2024_02_21_022902) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "analysts", force: :cascade do |t|
    t.string "name", null: false
    t.string "document"
    t.string "email"
    t.string "cellular"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "id_interno", default: 0
    t.string "name_contact"
    t.string "qualification"
    t.string "personal_email"
    t.string "work_email"
    t.string "address"
    t.string "city"
    t.string "pulled_apart"
    t.string "country"
    t.string "website"
    t.string "fax"
    t.string "company"
    t.string "position"
    t.string "deparment"
    t.string "agent"
    t.date "birthDate"
    t.integer "portal_Access", default: 0
    t.string "portal_User"
    t.string "portal_Pass"
    t.string "portal_Profile"
    t.string "portal_emaill"
    t.integer "state", default: 0
    t.string "phone_1"
    t.string "phone_2"
    t.string "cellular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_contacts_on_customer_id"
  end

  create_table "contract_products", force: :cascade do |t|
    t.integer "factor", default: 0
    t.integer "periodicity", default: 0
    t.decimal "cost", default: "0.0"
    t.date "date_initial"
    t.date "date_final"
    t.string "cod_product_inter"
    t.string "id_product_inter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contract_id"
    t.bigint "product_id"
    t.decimal "sale_value", default: "0.0"
    t.decimal "percentage", default: "0.0"
    t.index ["contract_id"], name: "index_contract_products_on_contract_id"
    t.index ["product_id"], name: "index_contract_products_on_product_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "name_project"
    t.string "name_promotora"
    t.string "classification"
    t.string "cost_center_interfuerza"
    t.string "id_cost_center_interfuerza"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id", null: false
    t.bigint "analyst_id", null: false
    t.string "status_contract"
    t.index ["analyst_id"], name: "index_contracts_on_analyst_id"
    t.index ["customer_id"], name: "index_contracts_on_customer_id"
  end

  create_table "cost_centers", force: :cascade do |t|
    t.string "id_interno"
    t.string "id_interfuerza"
    t.string "name"
    t.string "description"
    t.integer "inactive", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_name"
    t.integer "customer_class", default: 0
    t.integer "taxpayer_type", default: 0
    t.string "name"
    t.string "ruc"
    t.string "dv"
    t.integer "category", default: 0
    t.integer "priority", default: 0
    t.integer "employees", default: 0
    t.string "industry"
    t.date "birth_date"
    t.integer "taxes", default: 0
    t.integer "status", default: 0
    t.string "cellular"
    t.string "website"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "email"
    t.string "phone_1"
    t.string "phone_2"
    t.integer "credit_term", default: 0
    t.integer "due_days", default: 0
    t.integer "credit_amount_limit", default: 0
    t.integer "points_program", default: 0
    t.string "account_receivable"
    t.string "account_receivable_client"
    t.string "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_project"
    t.string "name_promotora"
    t.string "email_1"
    t.string "email_2"
    t.string "email_3"
    t.string "email_4"
    t.string "email_5"
    t.string "email_6"
    t.string "email_7"
    t.string "email_8"
    t.string "email_9"
    t.string "email_10"
    t.bigint "cost_center_id"
    t.integer "entity_id", default: 1
    t.index ["cost_center_id"], name: "index_customers_on_cost_center_id"
  end

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.string "banco"
    t.string "type_count"
    t.string "number_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_count"
    t.string "address_completa"
    t.string "document_entity"
    t.string "token"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pre_invoices", force: :cascade do |t|
    t.date "date_creation"
    t.date "date_filing"
    t.date "date_expiration"
    t.date "date_full_payment"
    t.date "date_last_payment"
    t.string "id_filing"
    t.integer "days_late", default: 0
    t.integer "state", default: 0
    t.string "observations"
    t.decimal "value_tax", default: "0.0"
    t.decimal "value_discount", default: "0.0"
    t.decimal "value_bruto", default: "0.0"
    t.decimal "value_interest", default: "0.0"
    t.decimal "value_others", default: "0.0"
    t.decimal "value_neto", default: "0.0"
    t.decimal "total_balance", default: "0.0"
    t.integer "value_paid", default: 0
    t.integer "user_pre_invoice", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contract_id"
    t.bigint "product_id"
    t.bigint "customer_id"
    t.bigint "analyst_id"
    t.bigint "contract_product_id"
    t.index ["analyst_id"], name: "index_pre_invoices_on_analyst_id"
    t.index ["contract_id"], name: "index_pre_invoices_on_contract_id"
    t.index ["contract_product_id"], name: "index_pre_invoices_on_contract_product_id"
    t.index ["customer_id"], name: "index_pre_invoices_on_customer_id"
    t.index ["product_id"], name: "index_pre_invoices_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "brands"
    t.string "type_product"
    t.string "category_l1"
    t.string "category_l2"
    t.string "category_l3"
    t.decimal "cost", default: "0.0"
    t.string "codigo_inter"
    t.string "id_inter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state_product"
    t.string "detail"
    t.string "item_number"
    t.string "store_product"
    t.string "taxid"
  end

  create_table "users", force: :cascade do |t|
    t.string "nro_document", null: false
    t.string "name"
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.integer "state", default: 0
    t.integer "level", default: 0
    t.string "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "entity_id", default: 1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nro_document"], name: "index_users_on_nro_document", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "contacts", "customers"
  add_foreign_key "contract_products", "contracts"
  add_foreign_key "contract_products", "products"
  add_foreign_key "contracts", "analysts"
  add_foreign_key "contracts", "customers"
  add_foreign_key "customers", "cost_centers"
  add_foreign_key "pre_invoices", "analysts"
  add_foreign_key "pre_invoices", "contract_products"
  add_foreign_key "pre_invoices", "contracts"
  add_foreign_key "pre_invoices", "customers"
  add_foreign_key "pre_invoices", "products"
end
