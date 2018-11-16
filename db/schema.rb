# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_16_140839) do

  create_table "pedidos", force: :cascade do |t|
    t.integer "produto_id"
    t.integer "usuario_id"
    t.float "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unidade_medida_id"
    t.integer "comprador_id"
    t.index ["comprador_id"], name: "index_pedidos_on_comprador_id"
    t.index ["produto_id"], name: "index_pedidos_on_produto_id"
    t.index ["unidade_medida_id"], name: "index_pedidos_on_unidade_medida_id"
    t.index ["usuario_id"], name: "index_pedidos_on_usuario_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidade_medidas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sigla"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "password"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "login"
    t.index ["login"], name: "index_usuarios_on_login", unique: true
  end

end
