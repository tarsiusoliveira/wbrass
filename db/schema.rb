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

ActiveRecord::Schema.define(version: 2022_02_27_182615) do

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.decimal "freq62hz"
    t.decimal "freq125hz"
    t.decimal "freq250hz"
    t.decimal "freq500hz"
    t.decimal "freq1k"
    t.decimal "freq2k"
    t.decimal "freq4k"
    t.decimal "freq8k"
    t.decimal "freq16k"
    t.decimal "scattering_coefficient"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plans", force: :cascade do |t|
    t.integer "vertices"
    t.json "xyz"
    t.string "name"
    t.string "material"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "positions", force: :cascade do |t|
    t.decimal "x"
    t.decimal "y"
    t.decimal "z"
    t.integer "shape"
    t.bigint "project_id", null: false
    t.string "positionee_type", null: false
    t.bigint "positionee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["positionee_type", "positionee_id"], name: "index_positions_on_positionee"
    t.index ["project_id"], name: "index_positions_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.decimal "temperature", precision: 8, scale: 2
    t.decimal "pressure", precision: 8, scale: 2
    t.decimal "humidity", precision: 8, scale: 2
    t.integer "sampleRate"
    t.decimal "irDuration", precision: 8, scale: 2
    t.integer "maxReflections"
    t.integer "energyDecay"
    t.integer "numRays"
    t.integer "clusterOrder"
    t.boolean "diffuseProcessing"
    t.boolean "saveLateRays"
    t.boolean "artificialTail"
    t.boolean "saveDiffuseRays"
    t.boolean "auralization"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "dxf_layers"
  end

  create_table "receivers", force: :cascade do |t|
    t.decimal "x"
    t.decimal "y"
    t.decimal "z"
    t.integer "reception_ray"
    t.integer "rotation"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sources", force: :cascade do |t|
    t.decimal "x", precision: 8, scale: 2
    t.decimal "y", precision: 8, scale: 2
    t.decimal "z", precision: 8, scale: 2
    t.integer "numRays"
    t.decimal "rotAz"
    t.decimal "rotEl"
    t.integer "spl1m"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "positions", "projects"
end
