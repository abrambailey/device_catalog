class AddStuffToStyles < ActiveRecord::Migration
  def change
  	add_column :styles, :power, :boolean
  	add_column :styles, :channels, :integer
  	add_column :styles, :bluetooth, :boolean
  	add_column :styles, :fm, :boolean
  	add_column :styles, :vc, :boolean
  	add_column :styles, :battery, :string
  	add_column :styles, :programs, :integer
  	add_column :styles, :generic, :string
  end
end
