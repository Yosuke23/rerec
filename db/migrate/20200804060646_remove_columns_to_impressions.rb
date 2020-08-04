class RemoveColumnsToImpressions < ActiveRecord::Migration[5.2]
  def change
   remove_reference :impressions, :register, foreign_key: true
   remove_reference :impressions, :second_register, foreign_key: true
  end
end
