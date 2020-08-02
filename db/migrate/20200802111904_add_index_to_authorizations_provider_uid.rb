class AddIndexToAuthorizationsProviderUid < ActiveRecord::Migration[5.2]
  def change
    add_index :authorizations, [:provider, :uid], unique: true
  end
end
