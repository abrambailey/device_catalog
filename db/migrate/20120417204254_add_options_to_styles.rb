class AddOptionsToStyles < ActiveRecord::Migration
  def change
  	add_column :styles, :options, :string
  end
end
