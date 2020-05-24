class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :googlebooksapi_id, null: false
      t.string :title, null: false
      t.string :author
      t.string :image
      t.text :description
      t.string :buy_link
      t.references :user, index: true, foreign_key: true
      t.date :published_at
      t.timestamps
    end
    add_index :books, :googlebooksapi_id, unique: true
    add_index :books, [:user_id, :created_at, :author, :title]
  end
end