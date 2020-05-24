class CreateRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :registers do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
      t.index [:user_id, :book_id], unique: true
    end
  end
end