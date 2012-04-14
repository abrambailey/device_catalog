class AddBrandIdToSubmodels < ActiveRecord::Migration
  def change
  	add_column :submodels, :brand_id, :integer
  end
end
