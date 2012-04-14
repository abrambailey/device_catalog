class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.integer :submodel_id

      t.timestamps
    end
  end
end
