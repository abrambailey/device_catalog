class AddImageToStyles < ActiveRecord::Migration
  def self.up
    change_table :styles do |t|
      t.has_attached_file :dimage
    end
  end

  def self.down
    drop_attached_file :styles, :dimage
  end
end
