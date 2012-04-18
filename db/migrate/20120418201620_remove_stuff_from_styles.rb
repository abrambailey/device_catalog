class RemoveStuffFromStyles < ActiveRecord::Migration
  def change
  	remove_column :styles, :power
  	remove_column :styles, :bluetooth
  	remove_column :styles, :fm
  	remove_column :styles, :vc
  end
end
