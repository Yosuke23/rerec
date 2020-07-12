class AddDetailsToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :title, :string
    add_column :impressions, :image, :string
  end
end
