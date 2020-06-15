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

ActiveRecord::Schema.define(version: 2020_06_15_045227) do

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "googlebooksapi_id", null: false
    t.string "title", null: false
    t.string "author"
    t.string "image"
    t.text "description"
    t.string "buy_link"
    t.bigint "user_id"
    t.date "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "readed_book_id"
    t.integer "want_book_id"
    t.index ["googlebooksapi_id"], name: "index_books_on_googlebooksapi_id", unique: true
    t.index ["user_id", "created_at", "author", "title"], name: "index_books_on_user_id_and_created_at_and_author_and_title"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "multiple_authors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "book_id"
    t.string "name", null: false
    t.boolean "is_representation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_multiple_authors_on_book_id"
  end

  create_table "registers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_registers_on_book_id"
    t.index ["user_id", "book_id"], name: "index_registers_on_user_id_and_book_id", unique: true
    t.index ["user_id"], name: "index_registers_on_user_id"
  end

  create_table "second_registers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_second_registers_on_book_id"
    t.index ["user_id"], name: "index_second_registers_on_user_id"
  end

  create_table "third_registers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_third_registers_on_book_id"
    t.index ["user_id"], name: "index_third_registers_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "books", "users"
  add_foreign_key "multiple_authors", "books"
  add_foreign_key "registers", "books"
  add_foreign_key "registers", "users"
  add_foreign_key "second_registers", "books"
  add_foreign_key "second_registers", "users"
  add_foreign_key "third_registers", "books"
  add_foreign_key "third_registers", "users"
end
