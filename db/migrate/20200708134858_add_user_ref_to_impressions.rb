class AddUserRefToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_reference :impressions, :user, foreign_key: true
    add_index :impressions, [:user_id, :created_at]
  end
end
