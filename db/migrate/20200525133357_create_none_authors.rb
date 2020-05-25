class CreateNoneAuthors < ActiveRecord::Migration[5.2]
  def change
   create_table :none_authors do |t|
     t.references :book, foreign_key: true
     t.string :name, null: false
     t.boolean :is_representation, null: false

     t.timestamps
   end
 end
end
