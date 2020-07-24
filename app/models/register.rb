 # == Schema Information
  # create_table "registers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  #   t.bigint "book_id"
  #   t.bigint "user_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["book_id"], name: "index_registers_on_book_id"
  #   t.index ["user_id", "book_id"], name: "index_registers_on_user_id_and_book_id", unique: true
  #   t.index ["user_id"], name: "index_registers_on_user_id"
class Register < ApplicationRecord
   belongs_to :user
   belongs_to :book
   validates :user_id, uniqueness: { scope: :book_id }
end