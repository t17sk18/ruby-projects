# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_13_071636) do

  create_table "carts", force: :cascade do |t|
    t.integer "cartId"
    t.string "email"
    t.integer "productId"
    t.integer "quantity"
    t.float "price"
    t.boolean "purchaseStatus"
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_carts_on_product_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "isocodes", force: :cascade do |t|
    t.string "isocode"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "matchId"
    t.string "round"
    t.string "date"
    t.float "avg_min_game"
    t.float "avg_seconds_point"
    t.float "avg_minutes_set"
    t.string "tournament"
    t.integer "year"
    t.integer "match_minutes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matchstats", force: :cascade do |t|
    t.integer "statId"
    t.string "matchId"
    t.string "playerId"
    t.integer "points"
    t.integer "rank"
    t.boolean "winner"
    t.integer "sets"
    t.integer "set1"
    t.integer "set2"
    t.integer "set3"
    t.integer "set4"
    t.integer "set5"
    t.float "avg_odds"
    t.float "max_odds"
    t.integer "total_pts"
    t.integer "serve_pt"
    t.integer "return_pt"
    t.integer "aces"
    t.integer "bp_saved"
    t.integer "bp_faced"
    t.integer "first_serve_rtn_won"
    t.integer "second_serve_rtn_won"
    t.integer "first_serve_in"
    t.integer "dbl_faults"
    t.float "first_server_per"
    t.integer "player_id", null: false
    t.integer "match_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_matchstats_on_match_id"
    t.index ["player_id"], name: "index_matchstats_on_player_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "orderId"
    t.string "userEmail"
    t.string "productsList"
    t.string "shippingAddress"
    t.datetime "orderDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "playerId"
    t.string "name"
    t.string "hand"
    t.string "country"
    t.string "birthday"
    t.integer "isocode_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["isocode_id"], name: "index_players_on_isocode_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "productId"
    t.string "productName"
    t.string "productDescription"
    t.float "productPrice"
    t.string "productColor"
    t.string "productSize"
    t.integer "productAvailability"
    t.text "productImage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "useraccounts", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "matchstats", "matches"
  add_foreign_key "matchstats", "players"
  add_foreign_key "players", "isocodes"
end
