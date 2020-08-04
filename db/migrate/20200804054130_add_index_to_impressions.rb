class AddIndexToImpressions < ActiveRecord::Migration[5.2]
  def change
   remove_index :impressions, [:register_id, :created_at]
   remove_index :impressions, [:second_register_id, :created_at]
  end
end
