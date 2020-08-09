class AddToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :published, :boolean, default: true
  end
end
