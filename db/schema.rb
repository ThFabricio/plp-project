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

ActiveRecord::Schema[7.0].define(version: 2022_10_06_024918) do
  create_table "atividade_categoria", force: :cascade do |t|
    t.integer "atividade_id", null: false
    t.integer "categorium_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atividade_id"], name: "index_atividade_categoria_on_atividade_id"
    t.index ["categorium_id"], name: "index_atividade_categoria_on_categorium_id"
  end

  create_table "atividades", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoria", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.string "cor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lembrete_categoria", force: :cascade do |t|
    t.integer "lembrete_id", null: false
    t.integer "categorium_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categorium_id"], name: "index_lembrete_categoria_on_categorium_id"
    t.index ["lembrete_id"], name: "index_lembrete_categoria_on_lembrete_id"
  end

  create_table "lembretes", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.datetime "dia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meta", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.string "frequencia"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_time"
    t.date "end_time"
  end

  create_table "meta_categoria", force: :cascade do |t|
    t.integer "metum_id", null: false
    t.integer "categorium_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categorium_id"], name: "index_meta_categoria_on_categorium_id"
    t.index ["metum_id"], name: "index_meta_categoria_on_metum_id"
  end

  add_foreign_key "atividade_categoria", "atividades"
  add_foreign_key "atividade_categoria", "categoria"
  add_foreign_key "lembrete_categoria", "categoria"
  add_foreign_key "lembrete_categoria", "lembretes"
  add_foreign_key "meta_categoria", "categoria"
  add_foreign_key "meta_categoria", "meta"
end
