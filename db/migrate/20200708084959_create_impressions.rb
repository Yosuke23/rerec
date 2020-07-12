class CreateImpressions < ActiveRecord::Migration[5.2]
  def change
    create_table :impressions do |t|
      t.text :content
      t.references :register, foreign_key: true
      t.references :second_register, foreign_key: true

      t.timestamps
    end
     add_index :impressions, [:register_id, :created_at]
     add_index :impressions, [:second_register_id, :created_at]
  end
end
