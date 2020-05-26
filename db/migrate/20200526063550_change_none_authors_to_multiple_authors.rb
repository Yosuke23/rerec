class ChangeNoneAuthorsToMultipleAuthors < ActiveRecord::Migration[5.2]
  def change
   rename_table :none_authors, :multiple_authors
  end
end
