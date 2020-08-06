class AddAuthsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :string
    add_column :users, :user, :string
    add_column :users, :user_id, :integer
  end
end
