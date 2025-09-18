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

ActiveRecord::Schema.define(version: 2025_09_17_105129) do

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name"
    t.string "first_name"
    t.boolean "enabled"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.text "text"
    t.string "email"
    t.string "phone_number"
    t.string "contact_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "information", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "kente_numbers", force: :cascade do |t|
    t.integer "number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["number"], name: "index_kente_numbers_on_number", unique: true
  end

  create_table "kente_ranks", force: :cascade do |t|
    t.string "rank"
    t.integer "passing_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "kentes", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "multiplication_score", default: 0, null: false
    t.integer "division_score", default: 0, null: false
    t.integer "mitori_score", default: 0, null: false
    t.integer "total_score", default: 0, null: false
    t.integer "kente_rank_id", null: false
    t.integer "kente_number_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kente_number_id"], name: "index_kentes_on_kente_number_id"
    t.index ["kente_rank_id"], name: "index_kentes_on_kente_rank_id"
    t.index ["student_id"], name: "index_kentes_on_student_id"
  end

  create_table "master_accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "address", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_master_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_master_accounts_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.integer "room_id", null: false
    t.string "sender_type"
    t.integer "sender_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_rooms_on_admin_id"
    t.index ["student_id"], name: "index_rooms_on_student_id"
  end

  create_table "sakura_print_numbers", force: :cascade do |t|
    t.integer "number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["number"], name: "index_sakura_print_numbers_on_number", unique: true
  end

  create_table "sakura_prints", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "multiplication_score", default: 0, null: false
    t.integer "division_score", default: 0, null: false
    t.integer "mitori_score", default: 0, null: false
    t.integer "mitori_anzan_score", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sakura_print_number_id", null: false
    t.integer "total_score", default: 0, null: false
    t.index ["sakura_print_number_id"], name: "index_sakura_prints_on_sakura_print_number_id"
    t.index ["student_id"], name: "index_sakura_prints_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "master_account_id", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rank_id"
    t.integer "next_kente_rank_id", default: 2
    t.index ["master_account_id"], name: "index_students_on_master_account_id"
    t.index ["next_kente_rank_id"], name: "index_students_on_next_kente_rank_id"
    t.index ["rank_id"], name: "index_students_on_rank_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "kentes", "kente_numbers"
  add_foreign_key "kentes", "kente_ranks"
  add_foreign_key "kentes", "students"
  add_foreign_key "messages", "rooms"
  add_foreign_key "rooms", "admins"
  add_foreign_key "rooms", "students"
  add_foreign_key "sakura_prints", "sakura_print_numbers"
  add_foreign_key "sakura_prints", "students"
  add_foreign_key "students", "kente_ranks", column: "next_kente_rank_id"
  add_foreign_key "students", "kente_ranks", column: "rank_id"
  add_foreign_key "students", "master_accounts"
end
