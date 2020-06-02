class AddRegistersToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :readed_book_id, :integer
    add_column :books, :want_book_id, :integer
  end
end
