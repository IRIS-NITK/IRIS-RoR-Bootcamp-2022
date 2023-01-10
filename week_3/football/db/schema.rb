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

ActiveRecord::Schema[7.0].define(version: 2023_01_10_105345) do
  create_table "football_players", force: :cascade do |t|
    t.string "name"
    t.integer "rank"
    t.string "country"
    t.string "position"
    t.string "squad"
    t.string "league"
    t.integer "age"
    t.integer "born"
    t.integer "minutes_played"
    t.integer "goals"
    t.integer "penalty_kicks_made"
    t.integer "matches_played"
    t.integer "corner_kicks"
    t.integer "yellow_card"
    t.integer "red_card"
    t.integer "penalty_kicks_won"
    t.integer "fouls_committed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
