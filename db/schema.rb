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

ActiveRecord::Schema[7.0].define(version: 2022_10_05_170332) do
  create_table "categoria", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.string "cor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lembretes", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.datetime "dia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "categoria_id", null: false
    t.index ["categoria_id"], name: "index_lembretes_on_categoria_id"
  end

  create_table "meta", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.string "frequencia"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "categoria_id", null: false
    t.index ["categoria_id"], name: "index_meta_on_categoria_id"
  end

  create_table "tarefas", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.datetime "horaInicio"
    t.datetime "horaFim"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "lembretes", "categoria", column: "categoria_id"
  add_foreign_key "meta", "categoria", column: "categoria_id"
end
