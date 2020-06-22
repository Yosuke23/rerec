# == Schema Information
  # create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  #   t.string "googlebooksapi_id", null: false
  #   t.string "title", null: false
  #   t.string "author"
  #   t.string "image"
  #   t.text "description"
  #   t.string "buy_link"
  #   t.bigint "user_id"
  #   t.date "published_at"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["googlebooksapi_id"], name: "index_books_on_googlebooksapi_id", unique: true
  #   t.index ["user_id", "created_at", "author", "title"], name: "index_books_on_user_id_and_created_at_and_author_and_title"
  #   t.index ["user_id"], name: "index_books_on_user_id"
  # end

class Book < ApplicationRecord
  # google books APIから取得したimageを保存する
  mount_uploader :image, ImageUploader
  has_many :users, through: :registers
  has_many :users, through: :second_registers
  has_many :users, through: :third_registers

  has_many :registers, dependent: :destroy
  has_many :second_registers, dependent: :destroy
  has_many :third_registers, dependent: :destroy
  has_many :multiple_authors, dependent: :destroy
  accepts_nested_attributes_for :registers
  accepts_nested_attributes_for :second_registers
  accepts_nested_attributes_for :third_registers

  validates :title, presence: true, length: { maximum: 255 }
  validates :googlebooksapi_id, presence: true,
                    length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
end
