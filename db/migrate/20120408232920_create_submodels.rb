class CreateSubmodels < ActiveRecord::Migration
  def change
    create_table :submodels do |t|
      t.string :name
      t.integer :model_id

      t.timestamps
    end
  end
end
