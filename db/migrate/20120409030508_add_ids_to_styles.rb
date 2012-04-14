class AddIdsToStyles < ActiveRecord::Migration
  def change
  	add_column :styles, :model_id, :integer
  	add_column :styles, :brand_id, :integer
  end
end
